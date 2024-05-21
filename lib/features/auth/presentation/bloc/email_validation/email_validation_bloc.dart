import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../../../core/common/u_validations_all.dart';
import 'email_validation_event.dart';
import 'email_validation_state.dart';


class EmailTextFieldValidationBloc extends Bloc<TextFieldValidation, TextfieldValidationState> {
  EmailTextFieldValidationBloc({required borderColor}) : super(TextfieldValidationInitial()) {
    on<TextfieldValidationEvent>((event, emit) async {
      String? _value = event.textValue;
      if (ValidationsAll.isValidEmail(_value!)) {
        emit(TextFieldValidationSuccess());
      }else{
        emit(TextfieldValidationFailure());
        await Future.delayed(const Duration(seconds: 3), () {
          emit(TextFieldValidationSuccess());// Prints after 1 second.
        });
      }

    });
  }
}
