import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/core/common/widgets/label.dart';
import 'package:pos_admin/features/home/users/presentation/new_user_creation.dart';

class EditPermissionScreen extends StatefulWidget {
  const EditPermissionScreen({super.key});

  @override
  State<EditPermissionScreen> createState() => _EditPermissionScreen();
}

class _EditPermissionScreen extends State<EditPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    // !------------------------------------

    final screensize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    print("Screen Width: $screenWidth");
    print("Screen Height: $screenHeight");

    // !------------------------------------
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
                  top: 20.0, bottom: 8, right: 10, left: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Edit Permission",
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
                    ),

                    // ! 3rd row

                    Padding(
                      padding: EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 8, top: 8),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(height: 10),
                            SizedBox(
                              width: screenWidth * 0.31,
                              child: CustomTextField(
                                controller: nameController,
                                width: screensize.width,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            width: 150,
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
        ));
  }
}
