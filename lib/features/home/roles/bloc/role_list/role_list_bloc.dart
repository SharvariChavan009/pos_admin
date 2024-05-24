import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pos_admin/features/home/roles/bloc/role_list/role_list_event.dart';
import 'package:pos_admin/features/home/roles/bloc/role_list/role_list_state.dart';
import 'package:pos_admin/features/home/tenants/bloc/tenant_list/tenant_list_event.dart';
import 'package:pos_admin/features/home/tenants/bloc/tenant_list/tenant_list_state.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../../../core/common/api_constants.dart';
import '../../../tenants/data/tenant_data.dart';
import '../../data/role_data.dart';


class RoleListBloc extends Bloc<RoleListEvent, RoleListState> {
  final Dio _dio = Dio();
  var url= ApiConstants.apiRoleList;
  String? _accessToken;
  RoleListBloc() : super(RoleListInitialState()) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ));
    on<RoleListFetch>((event, emit) async {
      var box = await Hive.openBox('userData');
      _accessToken = box.get("accessToken");
      try {
        final response = await _dio.get(
            url,
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': "Bearer $_accessToken",
              },
            )
        );
        if (response.statusCode == 200) {
          List<Role> roles = rolesFromJson(json.encode(response.data));
          emit(RoleListSuccessState(role: roles));
        } else {
          emit(RoleListFailureState());
        }
      } catch (error) {
        emit(RoleListFailureState());
      }
    });
  }
}
