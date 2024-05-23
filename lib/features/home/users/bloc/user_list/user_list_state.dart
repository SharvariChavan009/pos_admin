import '../../data/user_data.dart';

abstract class UserListState{}

final class UserListInitialState extends UserListState{}

final class UserListLoadingState extends UserListState{}
final class UserListSuccessState extends UserListState{
  List<User>? users;
  UserListSuccessState({required this.users});
}

final class UserListFailureState extends UserListState{}