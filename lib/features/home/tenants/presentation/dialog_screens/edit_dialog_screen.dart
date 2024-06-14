import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/core/common/widgets/label.dart';
import 'package:pos_admin/features/home/users/presentation/new_user_creation.dart';

class NewEditTenantDialogScreen extends StatefulWidget {
  const NewEditTenantDialogScreen({super.key});

  @override
  State<NewEditTenantDialogScreen> createState() =>
      _NewEditTenantDialogScreen();
}

class _NewEditTenantDialogScreen extends State<NewEditTenantDialogScreen> {
  final int _itemCount = 10;
  List<bool> _checked = [];
  bool isChecked = false;
  @override
  void initState() {
    super.initState();

    _checked = List<bool>.filled(_itemCount, false);
    _controller1.text = "0";
    _controller2.text = "0";
  }

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // !------------------------------------

    final screenSize = MediaQuery.of(context).size;
    List<String> selectedItemValue = [];
    List<DropdownMenuItem<String>> _dropDownItem() {
      List<String> itemValue = ["Select an option", "gokul", "Kolhapur"];

      return itemValue
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList();
    }

    bool _switchValue = true;
    String dropdownValue = 'Select an option';
    String dropdownValue2 = 'Select an option';

    final screensize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const double minHeight = 42.0;
    const double minWidth = 200.0;

    print("Screen Width: $screenWidth");
    print("Screen Height: $screenHeight");

    // !------------------------------------
    return Dialog(
        backgroundColor: AppColors.lightGreyColor,
        child: SizedBox(
          width: screensize.width * 0.7, // 80% of screen width
          height: screensize.height * 0.99, // 50% of screen height

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
                            "Create tenant unit",
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

                    // ! 1st row

                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 8, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 0.3,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: AutoSizeText(
                                          'Details',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.white,
                                thickness: 0.3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 20,
                                              right: 20),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Image",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: 80,
                                                  height: 80,
                                                  child: InkWell(
                                                    onTap: () {
                                                      print(
                                                          "Image picker clicked!");
                                                    },
                                                    child: const Icon(
                                                      Icons.camera_alt,
                                                      size: 30,
                                                      color:
                                                          AppColors.iconColor,
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black
                                                        .withOpacity(.2),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 6,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              left: 20,
                                              right: 20),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: const Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Name",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Text(
                                                              "*",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
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
                                                Row(children: [
                                                  Switch(
                                                      activeColor:
                                                          AppColors.baseColor,
                                                      value: _switchValue,
                                                      onChanged: (value) {
                                                        _switchValue = value;
                                                      }),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.0),
                                                    child: Text("Active",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        )),
                                                  ),
                                                  const SizedBox(
                                                    width: 60,
                                                  ),
                                                  Switch(
                                                      activeColor:
                                                          AppColors.baseColor,
                                                      value: _switchValue,
                                                      onChanged: (value) {
                                                        _switchValue = value;
                                                      }),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.0),
                                                    child: Text("Main Branch",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        )),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),

                    // ! 2nd row

                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 20, top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 0.3,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: AutoSizeText(
                                          'Address',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.white,
                                thickness: 0.3,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 4, bottom: 4),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    "Lane 1",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Text(
                                                      "*",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              CustomTextField(
                                                controller: nameController,
                                                width: screensize.width,
                                              ),
                                            ],
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Lane 2",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(height: 10),
                                                CustomTextField(
                                                  controller: nameController,
                                                  width: screensize.width,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Lane 3",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(height: 10),
                                              CustomTextField(
                                                controller: nameController,
                                                width: screensize.width,
                                              ),
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Landmark",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(height: 10),
                                              CustomTextField(
                                                controller: nameController,
                                                width: screensize.width,
                                              ),
                                            ],
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                const Row(
                                                  children: [
                                                    Text(
                                                      "Postal Code",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Text(
                                                        "*",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                CustomTextField(
                                                  controller: nameController,
                                                  width: screensize.width,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    "City",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Text(
                                                      "*",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              CustomTextField(
                                                controller: nameController,
                                                width: screensize.width,
                                              ),
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Country",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                height:
                                                    (screenSize.height * 0.050)
                                                        .clamp(minHeight,
                                                            double.infinity),
                                                width: (screenSize.width * 0.21)
                                                    .clamp(minWidth,
                                                        double.infinity),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: AppColors.iconColor
                                                          .withOpacity(.2),
                                                      width: .5,
                                                    ),
                                                    color: Colors.black
                                                        .withOpacity(.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  iconEnabledColor:
                                                      Colors.white,
                                                  iconDisabledColor:
                                                      Colors.white,
                                                  style: const TextStyle(
                                                    color: AppColors.iconColor,
                                                  ),
                                                  decoration:
                                                      const InputDecoration(
                                                    enabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                  dropdownColor:
                                                      AppColors.primaryColor,
                                                  value: dropdownValue,
                                                  items: <String>[
                                                    'Select an option',
                                                    'Afghanistan',
                                                    'Brazil',
                                                    'India'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                CustomLabels
                                                                    .primaryFont,
                                                            color: AppColors
                                                                .iconColor,
                                                            fontSize: 13),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    dropdownValue = newValue!;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "State",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  height: (screenSize.height *
                                                          0.050)
                                                      .clamp(minHeight,
                                                          double.infinity),
                                                  width:
                                                      (screenSize.width * 0.21)
                                                          .clamp(minWidth,
                                                              double.infinity),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: AppColors
                                                            .iconColor
                                                            .withOpacity(.2),
                                                        width: .5,
                                                      ),
                                                      color: Colors.black
                                                          .withOpacity(.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child:
                                                      DropdownButtonFormField<
                                                          String>(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    iconEnabledColor:
                                                        Colors.white,
                                                    iconDisabledColor:
                                                        Colors.white,
                                                    style: const TextStyle(
                                                      color:
                                                          AppColors.iconColor,
                                                    ),
                                                    decoration:
                                                        const InputDecoration(
                                                      enabledBorder:
                                                          InputBorder.none,
                                                    ),
                                                    dropdownColor:
                                                        AppColors.primaryColor,
                                                    value: dropdownValue,
                                                    items: <String>[
                                                      'Select an option',
                                                      'Assam',
                                                      'Karnataka',
                                                      'Rajasthan'
                                                    ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          style: const TextStyle(
                                                              fontFamily:
                                                                  CustomLabels
                                                                      .primaryFont,
                                                              color: AppColors
                                                                  .iconColor,
                                                              fontSize: 13),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged:
                                                        (String? newValue) {
                                                      dropdownValue = newValue!;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),

                    // ! 3rd row

                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 8, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 0.3,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: AutoSizeText(
                                          'Location',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.white,
                                thickness: 0.3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20.0,
                                          left: 20,
                                          bottom: 4,
                                          top: 4),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            child: Column(
                                              children: [
                                                const Row(
                                                  children: [
                                                    Text(
                                                      "Lattitude",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                CustomTextField(
                                                  inputType: CustomTextInputType
                                                      .number,
                                                  controller: nameController,
                                                  width: screensize.width,
                                                ),
                                              ],
                                            ),
                                          )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Column(
                                              children: [
                                                const Row(
                                                  children: [
                                                    Text(
                                                      "Longitude",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                CustomTextField(
                                                  inputType: CustomTextInputType
                                                      .number,
                                                  controller: nameController,
                                                  width: screensize.width,
                                                ),
                                              ],
                                            ),
                                          )),
                                          //! DO NOT CHANGE
                                          Expanded(
                                              child: Container(
                                            child: Column(
                                              children: [
                                                const Row(
                                                  children: [
                                                    Text(
                                                      "temp",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .lightGreyColor),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          height: 10,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                          //! DO NOT CHANGED ------------------
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
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
