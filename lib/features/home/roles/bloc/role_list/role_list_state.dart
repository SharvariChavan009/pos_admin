

import '../../data/role_data.dart';

abstract class RoleListState{}

final class RoleListInitialState extends RoleListState{}

final class RoleListLoadingState extends RoleListState{}
final class RoleListSuccessState extends RoleListState{
  List<Role>? role;
  RoleListSuccessState({required this.role});
}

final class RoleListFailureState extends RoleListState{}