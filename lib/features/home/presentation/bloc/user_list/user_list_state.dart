import '../../../data/users/user_data.dart';

abstract class UserListState{}

final class UserListInitialState extends UserListState{}

final class UserListSuccessState extends UserListState{
  List<UserData>? users;
  UserListSuccessState({required this.users});
}

final class UserListFailureState extends UserListState{}