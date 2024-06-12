import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/features/home/users/presentation/new_user_creation.dart';

class NewTenantCreation extends StatefulWidget {
  const NewTenantCreation({super.key});

  @override
  State<NewTenantCreation> createState() => _NewTenantCreationState();
}

class _NewTenantCreationState extends State<NewTenantCreation> {
  @override
  Widget build(BuildContext context) {
    //! ------------------------------------
    bool _switchValue = true;
    var screensize = MediaQuery.of(context).size;
    print("ScreenSize: $screensize");
    //! ------------------------------------

    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            color: Colors.amberAccent,
            child: Expanded(
              child: Container(
                color: AppColors.darkColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    //! section One

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        hintText: "Name",
                        controller: nameController,
                        width: screensize.width,
                      ),

                      //! section Two

                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 37.0),
                              child: Container(
                                color: AppColors.darkColor,
                                child: Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Image",
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
                                )),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: AppColors.darkColor,
                              child: Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Website",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      CustomTextField(
                                        controller: nameController,
                                        width: screensize.width * 0.3
                                      ),
                                    ],
                                  )
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),

                      //! section Three

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Tax Number",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        CustomTextField(
                                          hintText: "E.g GST in India",
                                          controller: nameController,
                                          width: screensize.width * 0.35,
                                        ),
                                        // Container(
                                        //   color: Colors.red,
                                        //   child:
                                        //   Icon(Icons.web),
                                        // )
                                      ],
                                    )
                                  ],
                                )),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Switch(
                                          activeColor: AppColors.baseColor,
                                          value: _switchValue,
                                          onChanged: (value) {
                                            _switchValue = value;
                                          }),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        "Active",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),

                      //! section Four

                      Padding(
                        padding: const EdgeInsets.only(top: 30),
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
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Container(
                              width: screensize.width * 0.12,
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
                            width: screensize.width * 0.06,
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
          ),
        ),
      ),
    );
  }
}
