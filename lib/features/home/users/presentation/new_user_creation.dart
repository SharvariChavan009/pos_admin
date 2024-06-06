import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/core/common/widgets/w_custom_button.dart';
import 'package:pos_admin/core/utils/device_dimension.dart';
import 'package:pos_admin/features/home/users/bloc/new_user/new_user_bloc.dart';
import 'package:pos_admin/features/home/users/bloc/new_user/new_user_event.dart';
import '../../../../core/common/widgets/label.dart';

TextEditingController nameController = TextEditingController();

class NewUser extends StatelessWidget {
  const NewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right:70,left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("Profile Photo",style: CustomLabels.regularTextStyle(),),

                 const Padding(
                   padding: EdgeInsets.only(top: 12,bottom: 12),
                   child: CircleAvatar(
                     radius: 50,
                     backgroundImage: NetworkImage(
                         'https://example.com/profile_photo.jpg'), // Replace with your image URL or use AssetImage for local images
                   ),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("Name",style: CustomLabels.regularTextStyle(),),
                        CustomTextField(
                          width: DeviceUtils.getDeviceDimension(context).width * 0.35,
                            hintText: "Name", controller: nameController),
                        const SizedBox(height: 10),
                       Text("Phone Number",style: CustomLabels.regularTextStyle()),
                        CustomTextField(
                          width: DeviceUtils.getDeviceDimension(context).width * 0.35,
                          hintText: "Phone Number",
                          controller: nameController,
                        ),
                        const SizedBox(height: 10),
                        Text("Confirm Password",style: CustomLabels.regularTextStyle()),

                        CustomTextField(
                          width: DeviceUtils.getDeviceDimension(context).width * 0.35,
                          hintText: "Confirm Password",
                          controller: nameController,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email",style: CustomLabels.regularTextStyle()),
                        CustomTextField(
                            width: DeviceUtils.getDeviceDimension(context).width * 0.35,
                            hintText: "Email", controller: nameController),
                        const SizedBox(height: 10),
                        Text("Password",style: CustomLabels.regularTextStyle()),
                        CustomTextField(
                          width: DeviceUtils.getDeviceDimension(context).width * 0.35,
                          hintText: "Password",
                          controller: nameController,
                        ),
                        const SizedBox(height: 10),
                        Text("Roles",style: CustomLabels.regularTextStyle()),
                        CustomTextField(
                          width: DeviceUtils.getDeviceDimension(context).width * 0.35,
                          hintText: "Roles",
                          controller: nameController,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 20),
            child: Row(children: [
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
          ),
          // Row(children: [
          //   Container(
          //     width: 1000,
          //     height: 110, // Provide a fixed width
          //     color: Colors.green,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           height: 100,
          //           width: 800, // Provide a fixed height
          //           color: Colors.orange,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text("Email"),
          //               SizedBox(height: 1),
          //               CustomTextField(
          //                   hintText: "Email", controller: nameController),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ]),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(children: [
            Column(
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
                        onPressed: () {
                          BlocProvider.of<NewUserBloc>(context).add(NewUserCreatePressedEvent());
                        },
                      ),
                        const SizedBox(
                        height: 10,
                      ),
                        CustomButton(
                        backgroundColor: AppColors.baseColor,
                        text: "Create & create another",
                        onPressed: () {},
                      ),
                        const SizedBox(
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
          ]),
        ],
      ),
    );
  }
}
