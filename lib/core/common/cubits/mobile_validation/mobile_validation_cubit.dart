import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_admin/core/common/cubits/Textfield_validation/textfield_validation_cubit.dart';
import 'package:pos_admin/core/common/u_validations_all.dart';
import 'package:pos_admin/core/common/validation_variables.dart';

part 'mobile_validation_state.dart';

class MobileValidationCubit extends Cubit<MobileValidationState> {
  MobileValidationCubit() : super(MobileValidationInitial()) {}

  void validateMobileNumber(String mobileNumber)async {
   
    if (ValidationsAll.isValidMobileNumber(mobileNumber)) {
      ValidationAllVariables.mobileVar = true;
      emit(MobileValidationSuccess());
    } else {
      ValidationAllVariables.mobileVar = false;

      emit(MobileValidationFailure("Invalid mobile number"));
       return await Future.delayed(const Duration(seconds: 3), () {
        emit(MobileValidationState());
      });
    }
  }

 
}
