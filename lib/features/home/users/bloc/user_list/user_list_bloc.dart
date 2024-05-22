import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pos_admin/features/home/users/bloc/user_list/user_list_event.dart';
import 'package:pos_admin/features/home/users/bloc/user_list/user_list_state.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../../core/common/api_constants.dart';
import '../../data/user_data.dart';


class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final Dio _dio = Dio();
  var url= ApiConstants.apiUserList;
  String? _accessToken;
  UserListBloc() : super(UserListInitialState()) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ));
    on<UserListFetch>((event, emit) async {
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
          UserListResponse user = UserListResponse.fromJson(responseData);
          print(user.users[0].name);
          emit(UserListSuccessState(users: user.users));
        } else {
          emit(UserListFailureState());
        }
      } catch (error) {
        emit(UserListFailureState());
      }
    });
  }
}
