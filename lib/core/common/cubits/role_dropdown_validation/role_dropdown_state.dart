part of 'role_dropdown_cubit.dart';

@immutable
sealed class RoleDropdownState {}

final class RoleDropdownInitial extends RoleDropdownState {}

final class RoleDropdownSuccess extends RoleDropdownState {}

final class RoleDropdownError extends RoleDropdownState {

  String message;


RoleDropdownError({required this.message});

}

