import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../../core/common/api_constants.dart';
import 'logout_event.dart';
import 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    final Dio _dio = Dio();
    var url= ApiConstants.apiLogout;
    String? _accessToken;
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ));
    on<LogoutButtonPressed>((event, emit) async {
      var box = await Hive.openBox('userData');
      _accessToken = box.get("accessToken");
      try {
        final response = await _dio.post(
            url,
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': "Bearer $_accessToken",
              },
            )
        );
        if (response.statusCode == 200) {
          emit(LogoutSuccess());
        } else {
          emit(LogoutFailure());
        }
      } catch (error) {
        emit(LogoutFailure());
      }
    });
  }
}
