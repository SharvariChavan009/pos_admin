import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:pos_admin/features/home/users/bloc/new_user/new_user_event.dart';
import 'package:pos_admin/features/home/users/bloc/new_user/new_user_state.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../../core/common/api_constants.dart';


class NewUserBloc extends Bloc<NewUserCreateEvent, NewUserCreateState> {
  final Dio _dio = Dio();
  var url= ApiConstants.apiCreateNewUser;
  String? _accessToken;
  NewUserBloc() : super(NewUserCreateInitialState()) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ));
    on<NewUserCreatePressedEvent>((event, emit) async {
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
          // List<User> users = usersFromJson(json.encode(response.data));
          emit(NewUserCreateSuccessState());
        } else {
          emit(NewUserCreateFailureState());
        }
      } catch (error) {
        emit(NewUserCreateFailureState());
      }
    });
  }
}
