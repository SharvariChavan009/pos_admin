import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/cubits/Textfield_validation/textfield_validation_cubit.dart';
import 'package:pos_admin/core/common/validation_variables.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/features/home/users/presentation/new_user_creation.dart';

import '../../presentation/bloc/menu_name_bloc.dart';
import '../../presentation/bloc/menu_name_event.dart';

class NewRoleCreation extends StatefulWidget {
  const NewRoleCreation({super.key});

  @override
  State<NewRoleCreation> createState() => _NewRoleCreationState();
}

class _NewRoleCreationState extends State<NewRoleCreation> {
  TextEditingController roleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //! ------------------------------------

    var screensize = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    print("ScreenSize: $screensize");
    //! ------------------------------------
    return Dialog(
      backgroundColor: AppColors.lightGreyColor,
      child: SizedBox(
        width: screensize.width * 0.6, // 80% of screen width
        height: screensize.height * 0.46, // 50% of screen height

        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(15)),
          // height: screenHeight * 0.50,
          // width: screenWidth * 0.25,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 8, right: 10, left: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! Section One

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Create role",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          BlocProvider.of<MenuNameBloc>(context).add(
                              MenuNameSelected(
                                  context: context, menuName: 'Roles'));
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //! Section Two

                  BlocBuilder<TextfieldValidationCubit,
                      TextfieldValidationState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Name",
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
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: roleController,
                                  borderColor: (state is TextValidationError
                                      ? Colors.red
                                      : AppColors.iconColor.withOpacity(0.2)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 1),
                          Visibility(
                              visible: state is TextValidationError,
                              child: (state is TextValidationError)
                                  ? Text(
                                      state.message,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                    )
                                  : Text("")),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Permissions",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),

                  CustomTextField(
                    hintText: "Start typing to search",
                    controller: nameController,
                    width: screensize.width,
                  ),

                  //! Section Three

                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<TextfieldValidationCubit>(context)
                              .validate(roleController.text);

                          if (ValidationAllVariables.roleVar == true) {
                            print("Role Created");
                          } else {
                            print("Role Failed");
                          }
                        },
                        child: Container(
                          width: screensize.width * 0.06,
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
                          width: screensize.width * 0.12,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 0.5,
                              ),
                              color: AppColors.lightGreyColor,
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
                        width: screensize.width * 0.06,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 0.5,
                            ),
                            color: AppColors.lightGreyColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
        ),
      ),
    );
  }
}
