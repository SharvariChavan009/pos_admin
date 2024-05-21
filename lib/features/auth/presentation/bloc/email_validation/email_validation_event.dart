

import 'dart:ui';

import 'email_validation_state.dart';

abstract class TextFieldValidation {}

class TextfieldValidationEvent extends TextFieldValidation {
  String? textValue;
  TextfieldValidationEvent(this.textValue);
}


class TextFieldValidationInitial extends TextfieldValidationState {
  Color? borderColor;
  TextFieldValidationInitial(this.borderColor);
}
