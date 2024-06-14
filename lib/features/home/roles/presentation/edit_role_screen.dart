import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/features/home/users/presentation/new_user_creation.dart';

class EditRoleScreen extends StatefulWidget {
  const EditRoleScreen({super.key});

  @override
  State<EditRoleScreen> createState() => _EditRoleScreenState();
}

class _EditRoleScreenState extends State<EditRoleScreen> {
  bool isChecked = false;

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
        height: screensize.height * 0.54, // 50% of screen height

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
                        "Edit role",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
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
                  CustomTextField(
                    controller: nameController,
                    width: screensize.width,
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Select all",
                    style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.baseColor,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        checkColor: Colors.white,
                        fillColor: WidgetStateProperty.all(isChecked == true
                            ? AppColors.baseColor
                            : AppColors.darkColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const FittedBox(
                        fit: BoxFit.contain,
                        child:Text(
                    "demo",
                    style: TextStyle(color: Colors.white),
                  ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          width: screensize.width * 0.09,
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
                                "Save changes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: screensize.width * 0.07,
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
