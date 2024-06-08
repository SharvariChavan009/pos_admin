import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/features/home/users/presentation/new_user_creation.dart';

class NewPermissionCreation extends StatefulWidget {
  const NewPermissionCreation({super.key});

  @override
  State<NewPermissionCreation> createState() => _NewPermissionCreationState();
}

class _NewPermissionCreationState extends State<NewPermissionCreation> {
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
        height: screensize.height * 0.33, // 50% of screen height

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
                        "Create permission",
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
                  SizedBox(
                    width: screenWidth*0.34,
                    child: CustomTextField(
                      controller: nameController,
                      width: screensize.width,
                    ),
                  ),
                  const SizedBox(height: 10),

                  //! Section Three

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(children: [
                      Container(
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
