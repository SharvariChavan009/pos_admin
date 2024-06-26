import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/core/common/widgets/label.dart';
import 'package:pos_admin/features/home/users/presentation/new_user_creation.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
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
    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: SingleChildScrollView(
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
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Container(
                            color: AppColors.darkColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Name",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 1),
                                CustomTextField(
                                    hintText: "Name",
                                    controller: nameController),
                                const SizedBox(height: 10),
                                const Text(
                                  "Phone Number",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 1),
                                CustomTextField(
                                  hintText: "Phone Number",
                                  controller: nameController,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Confirm Password",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 1),
                                CustomTextField(
                                  hintText: "Confirm Password",
                                  controller: nameController,
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
                                const Text(
                                  "Email",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 1),
                                CustomTextField(
                                    hintText: "Email",
                                    controller: nameController),
                                const SizedBox(height: 10),
                                const Text(
                                  "Password",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 1),
                                CustomTextField(
                                  hintText: "Password",
                                  controller: nameController,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Roles",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 1),
                                Container(
                                  height: (screenSize.height * 0.050)
                                      .clamp(minHeight, double.infinity),
                                  width: (screenSize.width * 0.22)
                                      .clamp(minWidth, double.infinity),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            AppColors.iconColor.withOpacity(.2),
                                        width: .5,
                                      ),
                                      color: Colors.black.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButtonFormField<String>(
                                    padding: const EdgeInsets.only(left: 10),
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.white,
                                    style: const TextStyle(
                                      color: AppColors.iconColor,
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
                                          style: const TextStyle(
                                              fontFamily:
                                                  CustomLabels.primaryFont,
                                              color: AppColors.iconColor,
                                              fontSize: 13),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      dropdownValue = newValue!;
                                    },
                                  ),
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
                                      itemCount: 2,
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
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                              padding: EdgeInsets
                                                                  .only(
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
                                                                        left:
                                                                            20,
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
                                                                        left:
                                                                            20),
                                                                child:
                                                                    Container(
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
                                                                    padding: const EdgeInsets
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
                                                                    value: selectedItemValue[
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
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.baseColor,
                            width: 0.2,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
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
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
