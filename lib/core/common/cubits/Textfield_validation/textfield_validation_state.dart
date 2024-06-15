part of 'textfield_validation_cubit.dart';

@immutable
sealed class TextfieldValidationState {}

final class TextfieldValidationInitial extends TextfieldValidationState {}

class TextValidationError extends TextfieldValidationState {
  final String message;

  TextValidationError(this.message);
}

class ValidationValid extends TextfieldValidationState {}
