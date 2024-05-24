import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pos_admin/features/home/tenants/bloc/tenant_list/tenant_list_event.dart';
import 'package:pos_admin/features/home/tenants/bloc/tenant_list/tenant_list_state.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../../../core/common/api_constants.dart';
import '../../data/tenant_data.dart';



class TenantListBloc extends Bloc<TenantListEvent, TenantListState> {
  final Dio _dio = Dio();
  var url= ApiConstants.apiTenantList;
  String? _accessToken;
  TenantListBloc() : super(TenantListInitialState()) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ));
    on<TenantListFetch>((event, emit) async {
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
          final dynamic responseData = response.data;
          List<Tenant> tenantlist = tenantsFromJson(json.encode(response.data));
          print(tenantlist.length);
          emit(TenantListSuccessState(tenants: tenantlist));
        } else {
          emit(TenantListFailureState());
        }
      } catch (error) {
        emit(TenantListFailureState());
      }
    });
  }
}
