import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/cubits/Textfield_validation/textfield_validation_cubit.dart';
import 'package:pos_admin/core/common/cubits/confirm_password/confirmpassword_cubit.dart';
import 'package:pos_admin/core/common/cubits/email_validation/email_cubit.dart';
import 'package:pos_admin/core/common/cubits/mobile_validation/mobile_validation_cubit.dart';
import 'package:pos_admin/core/common/cubits/password_validation/login_cubit.dart';
import 'package:pos_admin/core/common/cubits/role_dropdown_validation/role_dropdown_cubit.dart';
import 'package:pos_admin/core/common/u_validations_all.dart';
import 'package:pos_admin/core/common/validation_variables.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/core/common/widgets/label.dart';
import 'package:pos_admin/features/auth/presentation/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController nameController = TextEditingController();

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  TextEditingController unameController = TextEditingController();
  TextEditingController uemialController = TextEditingController();
  TextEditingController upasswordController = TextEditingController();
  TextEditingController uconfirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // !------------------------------------

    bool _switchValue = true;
    String dropdownValue = 'Select an option';

    final screenSize = MediaQuery.of(context).size;
    const double minHeight = 42.0;
    const double minWidth = 200.0;

    List<String> selectedItemValue = []; // ready
    List<DropdownMenuItem<String>> _dropDownItem() {
      List<String> itemValue = ["Select an option", "gokul", "Kolhapur"];

      return itemValue
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList();
    }

    // !------------------------------------
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: AppColors.darkColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Profile Photo",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),

                      // Todo: Image picker code logic
                      Container(
                        width: 90,
                        height: 90,
                        child: InkWell(
                          onTap: () {
                            print("Image picker clicked!");
                          },
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: AppColors.iconColor,
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(.2),
                        ),
                      ),
                      // Todo: ................................
                    ],
                  ),
                ),
              ),
              Container(
                color: AppColors.darkColor,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: Container(
                          color: AppColors.darkColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //! Name Field

                              BlocBuilder<TextfieldValidationCubit,
                                  TextfieldValidationState>(
                                builder: (context, state) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: const Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Name",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "*",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                      CustomTextField(
                                        hintText: "Name",
                                        controller: unameController,
                                        borderColor:
                                            (state is TextValidationError
                                                ? Colors.red
                                                : AppColors.iconColor
                                                    .withOpacity(0.2)),
                                      ),
                                      const SizedBox(height: 1),
                                      Visibility(
                                          visible: state is TextValidationError,
                                          child: (state is TextValidationError)
                                              ? Text(
                                                  state.message,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                )
                                              : Text("")),
                                      const SizedBox(height: 10),
                                    ],
                                  );
                                },
                              ),

                              //! Phone number Field

                              BlocBuilder<MobileValidationCubit,
                                  MobileValidationState>(
                                builder: (context, state) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                                      const SizedBox(height: 1),
                                      CustomTextField(
                                        inputType: CustomTextInputType.number,
                                        hintText: "Phone Number",
                                        controller: phoneController,
                                        borderColor:
                                            (state is MobileValidationFailure
                                                ? Colors.red
                                                : AppColors.iconColor
                                                    .withOpacity(0.2)),
                                      ),
                                      const SizedBox(height: 1),
                                      Visibility(
                                          visible:
                                              state is MobileValidationFailure,
                                          child:
                                              (state is MobileValidationFailure)
                                                  ? Text(
                                                      state.message,
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    )
                                                  : Text("")),
                                      const SizedBox(height: 10),
                                    ],
                                  );
                                },
                              ),

                              //! Confirm Password  Field

                              BlocBuilder<ConfirmpasswordCubit,
                                  ConfirmpasswordState>(
                                builder: (context, state) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                     Container(
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Confirm Password",
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                                      const SizedBox(height: 1),
                                      CustomTextField(
                                        inputType: CustomTextInputType.password,
                                        obscureText: true,
                                        hintText: "Confirm Password",
                                        controller: uconfirmPasswordController,
                                        borderColor:
                                            (state is ConfirmpassErrorState
                                                ? Colors.red
                                                : AppColors.iconColor
                                                    .withOpacity(0.2)),
                                      ),
                                      const SizedBox(height: 1),
                                      Visibility(
                                          visible:
                                              state is ConfirmpassErrorState,
                                          child:
                                              (state is ConfirmpassErrorState)
                                                  ? Text(
                                                      state.errorMessage,
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    )
                                                  : Text("")),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: AppColors.darkColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //! Email Field

                              BlocBuilder<EmailCubit, EmailState>(
                                builder: (context, state) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                        Container(
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                                      const SizedBox(height: 1),
                                      CustomTextField(
                                        hintText: "Email",
                                        controller: uemialController,
                                        borderColor:
                                            (state is EmailValidatorState
                                                ? Colors.red
                                                : AppColors.iconColor
                                                    .withOpacity(0.2)),
                                      ),
                                      const SizedBox(height: 10),
                                      Visibility(
                                          visible: state is EmailValidatorState,
                                          child: (state is EmailValidatorState)
                                              ? Text(
                                                  state.errorMessage2,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                )
                                              : Text("")),
                                    ],
                                  );
                                },
                              ),

                              //! Password Field

                              BlocBuilder<PasswordCubit, PasswordState>(
                                builder: (context, state) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                                      const SizedBox(height: 1),
                                      CustomTextField(
                                        inputType: CustomTextInputType.password,
                                        obscureText: true,
                                        hintText: "Password",
                                        controller: upasswordController,
                                        borderColor: (state is ErrorState1
                                            ? Colors.red
                                            : AppColors.iconColor
                                                .withOpacity(0.2)),
                                      ),
                                      const SizedBox(height: 1),
                                      Visibility(
                                          visible: state is ErrorState1,
                                          child: (state is ErrorState1)
                                              ? Text(
                                                  state.errorMessage2,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                )
                                              : Text("")),
                                      const SizedBox(height: 10),
                                    ],
                                  );
                                },
                              ),

                              //! Role Field

                              BlocBuilder<RoleDropdownCubit, RoleDropdownState>(
                                builder: (context, state) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Roles",
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                                      const SizedBox(height: 1),
                                      Container(
                                        height: (screenSize.height * 0.050)
                                            .clamp(minHeight, double.infinity),
                                        width: (screenSize.width * 0.22)
                                            .clamp(minWidth, double.infinity),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: (state is RoleDropdownError
                                                  ? Colors.red
                                                  : AppColors.iconColor
                                                      .withOpacity(0.2)),
                                              width: .5,
                                            ),
                                            color: Colors.black.withOpacity(.2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: DropdownButtonFormField<String>(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          iconEnabledColor: Colors.white,
                                          iconDisabledColor: Colors.white,
                                          style: TextStyle(
                                            color: dropdownValue ==
                                                    "Select an option"
                                                ? AppColors.iconColor
                                                : Colors.white,
                                          ),
                                          decoration: const InputDecoration(
                                            enabledBorder: InputBorder.none,
                                          ),
                                          dropdownColor: AppColors.primaryColor,
                                          value: dropdownValue,
                                          items: <String>[
                                            'Select an option',
                                            'Customer',
                                            'Manager',
                                            'Owner'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    fontFamily: CustomLabels
                                                        .primaryFont,
                                                    color: Colors.white,
                                                    fontSize: 13),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            dropdownValue = newValue!;
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                      Visibility(
                                          visible: state is RoleDropdownError,
                                          child: (state is RoleDropdownError)
                                              ? Text(
                                                  state.message,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                )
                                              : Text("")),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(children: [
                Switch(
                    activeColor: AppColors.baseColor,
                    value: _switchValue,
                    onChanged: (value) {
                      _switchValue = value;
                    }),
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text("Active",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkColor,
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(" Units",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 0.5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    "User tenant units",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      for (int i = 0; i < 3; i++) {
                                        selectedItemValue
                                            .add("Select an option");
                                      }
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20.0,
                                                  left: 20,
                                                  bottom: 8,
                                                  top: 8),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.darkColor,
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 0.3,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        10.0),
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: AppColors
                                                                  .errorColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Divider(
                                                        color: Colors.white,
                                                        thickness: 0.3,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          20.0,
                                                                      left: 20,
                                                                      bottom:
                                                                          5),
                                                              child: Text(
                                                                "Tenant unit",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          20.0,
                                                                      left: 20),
                                                              child: Container(
                                                                height: (screenSize
                                                                            .height *
                                                                        0.050)
                                                                    .clamp(
                                                                        minHeight,
                                                                        double
                                                                            .infinity),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: AppColors
                                                                            .darkColor,
                                                                        border: Border
                                                                            .all(
                                                                          color:
                                                                              Colors.white,
                                                                          width:
                                                                              0.2,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                child:
                                                                    DropdownButtonFormField(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10),
                                                                  iconEnabledColor:
                                                                      Colors
                                                                          .white,
                                                                  iconDisabledColor:
                                                                      Colors
                                                                          .white,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                  ),
                                                                  dropdownColor:
                                                                      AppColors
                                                                          .primaryColor,
                                                                  value:
                                                                      selectedItemValue[
                                                                          index],
                                                                  items:
                                                                      _dropDownItem(),
                                                                  onChanged:
                                                                      (value) {
                                                                    var selected;

                                                                    selected =
                                                                        selectedItemValue[index] =
                                                                            value!;

                                                                    print(
                                                                        "selected value is: $selected");
                                                                  },
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 9.0, bottom: 18),
                                  child: Center(
                                    child: Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.baseColor,
                                            width: 0.5,
                                          ),
                                          color: AppColors.baseColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Add to user tenant units",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      //* Name Field
                      BlocProvider.of<TextfieldValidationCubit>(context)
                          .validate(unameController.text);

                      //* Phone number Field

                      BlocProvider.of<MobileValidationCubit>(context)
                          .validateMobileNumber(phoneController.text);

                      //* Confirm password Field

                      BlocProvider.of<ConfirmpasswordCubit>(context)
                          .ConfirmPassFunction(upasswordController.text,
                              uconfirmPasswordController.text);

                      //* Email Field

                      BlocProvider.of<EmailCubit>(context)
                          .Loginvalidation1(uemialController.text);

                      //* Password Field

                      BlocProvider.of<PasswordCubit>(context)
                          .Loginvalidation(upasswordController.text);

                      //* Role Field

                      BlocProvider.of<RoleDropdownCubit>(context)
                          .dropdownFunction(dropdownValue);

                      if (ValidationAllVariables.confirmpasswordVar == true &&
                          ValidationAllVariables.dropdownVar == true &&
                          ValidationAllVariables.emailVar == true &&
                          ValidationAllVariables.mobileVar == true &&
                          ValidationAllVariables.passwordVar == true &&
                          ValidationAllVariables.textVar == true) {
                        print("user Created Successfully");
                      } else {
                        print("user Creation Failed");
                      }

// ----------------------
                    },
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.baseColor,
                            width: 0.5,
                          ),
                          color: AppColors.baseColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Create",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Container(
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,
                          ),
                          color: AppColors.darkColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Create & create another",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                        color: AppColors.darkColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
