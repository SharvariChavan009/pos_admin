part of 'login_cubit.dart';

sealed class PasswordState {}

class PasswordInitial extends PasswordState {}

class ErrorState1 extends PasswordState {
  String errorMessage2;

  ErrorState1({required this.errorMessage2});
}



