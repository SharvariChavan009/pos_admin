part of 'confirmpassword_cubit.dart';

@immutable
sealed class ConfirmpasswordState {}

final class ConfirmpasswordInitial extends ConfirmpasswordState {}

class ConfirmpassErrorState extends ConfirmpasswordState {
  String errorMessage;

  ConfirmpassErrorState({required this.errorMessage});
}
