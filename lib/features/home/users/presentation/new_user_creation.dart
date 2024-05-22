import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/core/common/widgets/w_custom_button.dart';

TextEditingController nameController = TextEditingController();

class NewUser extends StatelessWidget {
  const NewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 1000,
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  width: 400, // Provide a fixed width
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100, // Provide a fixed height
                        color: Colors.red,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Profile Photo"),
                            SizedBox(height: 1),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://example.com/profile_photo.jpg'), // Replace with your image URL or use AssetImage for local images
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 300, // Provide a fixed height
                        color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name"),
                            SizedBox(height: 1),
                            CustomTextField(
                                hintText: "Name", controller: nameController),
                            SizedBox(height: 10),
                            Text("Phone Number"),
                            SizedBox(height: 1),
                            CustomTextField(
                              hintText: "Phone Number",
                              controller: nameController,
                            ),
                            SizedBox(height: 10),
                            Text("Confirm Password"),
                            SizedBox(height: 1),
                            CustomTextField(
                              hintText: "Confirm Password",
                              controller: nameController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 400, // Provide a fixed width
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100, // Provide a fixed height
                        color: Colors.red,
                        child: const Visibility(
                          visible: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Profile Photo"),
                              SizedBox(height: 1),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://example.com/profile_photo.jpg'), // Replace with your image URL or use AssetImage for local images
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 300, // Provide a fixed height
                        color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email"),
                            SizedBox(height: 1),
                            CustomTextField(
                                hintText: "Email", controller: nameController),
                            SizedBox(height: 10),
                            Text("Password"),
                            SizedBox(height: 1),
                            CustomTextField(
                              hintText: "Password",
                              controller: nameController,
                            ),
                            SizedBox(height: 10),
                            Text("Roles"),
                            SizedBox(height: 1),
                            CustomTextField(
                              hintText: "Roles",
                              controller: nameController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Row(children: [
                Switch(
                    value: true,
                    activeColor: Colors.purple,
                    onChanged: (bool value) {
                      print("checked");
                    }),
                const Text("Active",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
              ]),
              Row(children: [
                Container(
                  width: 1000,
                  height: 110, // Provide a fixed width
                  color: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 800, // Provide a fixed height
                        color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email"),
                            SizedBox(height: 1),
                            CustomTextField(
                                hintText: "Email", controller: nameController),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Container(
                  width: 1000,
                  height: 380, // Provide a fixed width
                  color: Colors.purple,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        width: 1000, // Provide a fixed height
                        color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                            height: 10,
                        ),
                            const Text(" Units",style:
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                            const Divider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right:0),
                              width: 500,
                              height: 200,
                              color: Colors.cyanAccent,// Provide a fixed width
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                            children:[
                              CustomButton(
                              backgroundColor: AppColors.baseColor,
                              text: "Create",
                              onPressed: () {},
                            ),
                              SizedBox(
                              height: 10,
                            ),
                              CustomButton(
                              backgroundColor: AppColors.baseColor,
                              text: "Create & create another",
                              onPressed: () {},
                            ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomButton(
                              backgroundColor: AppColors.baseColor,
                              text: "Cancel",
                              onPressed: () {},)

                            ]
                            ),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
