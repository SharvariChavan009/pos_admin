part of 'mobile_validation_cubit.dart';

 class MobileValidationState {}

class MobileValidationInitial extends MobileValidationState {}

class MobileValidationSuccess extends MobileValidationState {}

class MobileValidationFailure extends MobileValidationState {
  final String message;

  MobileValidationFailure(this.message);
}