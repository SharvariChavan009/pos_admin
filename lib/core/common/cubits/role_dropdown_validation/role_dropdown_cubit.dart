import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_admin/core/common/validation_variables.dart';

part 'role_dropdown_state.dart';

class RoleDropdownCubit extends Cubit<RoleDropdownState> {
  RoleDropdownCubit() : super(RoleDropdownInitial()) {}

  void dropdownFunction(String selectedValue) async {
    if (selectedValue == "Select an option") {
      ValidationAllVariables.dropdownVar = false;
      emit(RoleDropdownError(message: "Please select option"));

      return await Future.delayed(const Duration(seconds: 3), () {
        emit(RoleDropdownSuccess());
      });
    } else {
      ValidationAllVariables.dropdownVar = true;

      emit(RoleDropdownSuccess());
    }
  }
}
