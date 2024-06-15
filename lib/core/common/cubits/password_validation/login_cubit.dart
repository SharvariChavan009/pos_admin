import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:pos_admin/core/common/u_validations_all.dart';
import 'package:pos_admin/core/common/validation_variables.dart';

part 'login_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  Dio dio = Dio();

  PasswordCubit() : super(PasswordInitial()) {}

//------------ Functions -----------------

  void Loginvalidation(String pass) async {
    // if 2
    if (pass.isEmpty) {
      ValidationAllVariables.passwordVar = false;
      emit(ErrorState1(errorMessage2: "Please enter a password"));
      return await Future.delayed(const Duration(seconds: 3), () {
        emit(PasswordInitial());
      });
    } else {
      if (ValidationsAll.isValidPassword(pass)) {
        ValidationAllVariables.passwordVar = true;

        emit(PasswordInitial());
      } else {
        ValidationAllVariables.passwordVar = false;

        emit(ErrorState1(errorMessage2: "Please enter valid password"));
        return await Future.delayed(const Duration(seconds: 3), () {
          emit(PasswordInitial());
        });
      }
    }
  }
}
