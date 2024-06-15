import 'package:bloc/bloc.dart';
import 'package:pos_admin/core/common/u_validations_all.dart';
import 'package:pos_admin/core/common/validation_variables.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitial()) {}

  void Loginvalidation1(String email) async {
    if (email.isEmpty) {
      ValidationAllVariables.emailVar = false;

      emit(EmailValidatorState(errorMessage2: "Please enter email address"));
      return await Future.delayed(const Duration(seconds: 3), () {
        emit(EmailInitial());
      });
    } else if (ValidationsAll.isValidEmail(email)) {
      ValidationAllVariables.emailVar = true;

      emit(EmailInitial());
    } else {
      ValidationAllVariables.emailVar = false;

      emit(EmailValidatorState(
          errorMessage2: "Please enter valid email address"));
      return await Future.delayed(const Duration(seconds: 3), () {
        emit(EmailInitial());
      });
    }
  }
}
