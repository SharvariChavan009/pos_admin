
import '../../users/data/user_data.dart';

abstract class MenuNameState {}

class MenuNameInitial extends MenuNameState {}
class MenuNameLoading extends MenuNameState {}
class MenuNameFetchedSuccess extends MenuNameState {
  final String name;
  User? selectedUser;
  MenuNameFetchedSuccess(this.name,this.selectedUser);
}
class MenuNameFetchedFailure extends MenuNameState {}
