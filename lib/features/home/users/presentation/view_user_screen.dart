import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/core/common/widgets/label.dart';
import 'package:pos_admin/features/home/roles/presentation/new_role_creation.dart';

import 'package:pos_admin/features/home/users/presentation/new_user_creation.dart';

class ViewUserScreen extends StatefulWidget {
  const ViewUserScreen({super.key});

  @override
  State<ViewUserScreen> createState() => _ViewUserScreenState();
}

class _ViewUserScreenState extends State<ViewUserScreen> {
  final int _itemCount = 10;
  List<bool> _checked = [];
  @override
  void initState() {
    super.initState();

    _checked = List<bool>.filled(_itemCount, false);
  }

  @override
  Widget build(BuildContext context) {
    // !------------------------------------
    bool _switchValue = true;
    String dropdownValue = 'Select an option'; // New user tenant units
    String dropdownValue2 = 'Select an option'; // edit

    final screensize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const double minHeight = 42.0;
    const double minWidth = 200.0;

    print("Screen Width: $screenWidth");
    print("Screen Height: $screenHeight");

    // !------------------------------------
    return Scaffold(
        backgroundColor: AppColors.darkColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //! Container - 1

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, bottom: 8, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.darkColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: AutoSizeText(
                                    'Personal',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 0.3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.0, left: 20, bottom: 5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: AutoSizeText(
                                              'Name',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: AutoSizeText(
                                              'Super Admin',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: AutoSizeText(
                                              'Phone',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: AutoSizeText(
                                              '9144558112',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: AutoSizeText(
                                              'Email',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: AutoSizeText(
                                              'admin@koptotech.com',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: AutoSizeText(
                                              'Active',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.green,
                                            size: 25,
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),

              //! Container - 2
              Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20, bottom: 8, top: 50),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkColor,
                    border: Border.all(
                      color: Colors.white,
                      width: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const FittedBox(
                            fit: BoxFit.contain,
                            child: AutoSizeText(
                              'Units',
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //! ----------showDialog (new user tenant units)----------------

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: AppColors.lightGreyColor,
                                      child: SizedBox(
                                        width: screensize.width *
                                            0.6, // 80% of screen width
                                        height: screensize.height *
                                            0.32, // 50% of screen height

                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.lightGreyColor,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          // height: screenHeight * 0.50,
                                          // width: screenWidth * 0.25,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0,
                                                bottom: 8,
                                                right: 10,
                                                left: 20),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "Create user tenant unit",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    "Tenant Unit",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Container(
                                                    height: (screensize.height *
                                                            0.050)
                                                        .clamp(minHeight,
                                                            double.infinity),
                                                    width: (screensize.width *
                                                            0.30)
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
                                                            BorderRadius
                                                                .circular(10)),
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
                                                      dropdownColor: AppColors
                                                          .primaryColor,
                                                      value: dropdownValue,
                                                      items: <String>[
                                                        'Select an option',
                                                        'Customer',
                                                        'Manager',
                                                        'Owner'
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
                                                        dropdownValue =
                                                            newValue!;
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 25),
                                                    child: Row(children: [
                                                      Container(
                                                        width:
                                                            screensize.width *
                                                                0.06,
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: AppColors
                                                                      .baseColor,
                                                                  width: 0.5,
                                                                ),
                                                                color: AppColors
                                                                    .baseColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                        child: const Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              "Create",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 15.0,
                                                                right: 15),
                                                        child: Container(
                                                          width:
                                                              screensize.width *
                                                                  0.12,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0.5,
                                                                  ),
                                                                  color: AppColors
                                                                      .lightGreyColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                          child: const Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "Create & create another",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            screensize.width *
                                                                0.06,
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 0.5,
                                                                ),
                                                                color: AppColors
                                                                    .lightGreyColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                        child: const Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
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
                                  });

                              //! --------------------------
                            },
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.baseColor,
                                    width: 0.5,
                                  ),
                                  color: AppColors.baseColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Text(
                                    "New user tenant units",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: _itemCount,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Row(
                                                  children: [
                                                    //? Checkbox

                                                    Checkbox(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      checkColor: Colors.white,
                                                      fillColor:
                                                          WidgetStateProperty.all(
                                                              _checked[index] ==
                                                                      true
                                                                  ? AppColors
                                                                      .baseColor
                                                                  : AppColors
                                                                      .darkColor),
                                                      value: _checked[index],
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          _checked[index] =
                                                              value!;
                                                        });
                                                      },
                                                    ),

                                                    //? ......................
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: AutoSizeText(
                                                        'Kolhapur',
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0, bottom: 10),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          //! ------ShowDilogue (edit)------------

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Dialog(
                                                                  backgroundColor:
                                                                      AppColors
                                                                          .lightGreyColor,
                                                                  child:
                                                                      SizedBox(
                                                                    width: screensize
                                                                            .width *
                                                                        0.6, // 80% of screen width
                                                                    height: screensize
                                                                            .height *
                                                                        0.32, // 50% of screen height

                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          color: AppColors
                                                                              .lightGreyColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15)),
                                                                      // height: screenHeight * 0.50,
                                                                      // width: screenWidth * 0.25,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                20.0,
                                                                            bottom:
                                                                                8,
                                                                            right:
                                                                                10,
                                                                            left:
                                                                                20),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  const Text(
                                                                                    "Edit user tenant unit",
                                                                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
                                                                              const SizedBox(height: 10),
                                                                              const Text(
                                                                                "Tenant Unit",
                                                                                style: TextStyle(color: Colors.white),
                                                                              ),
                                                                              const SizedBox(height: 10),
                                                                              Container(
                                                                                height: (screensize.height * 0.050).clamp(minHeight, double.infinity),
                                                                                width: (screensize.width * 0.30).clamp(minWidth, double.infinity),
                                                                                decoration: BoxDecoration(
                                                                                    border: Border.all(
                                                                                      color: AppColors.iconColor.withOpacity(.2),
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
                                                                                    'Gokul',
                                                                                    'Kolhapur',
                                                                                  ].map<DropdownMenuItem<String>>((String value) {
                                                                                    return DropdownMenuItem<String>(
                                                                                      value: value,
                                                                                      child: Text(
                                                                                        value,
                                                                                        style: const TextStyle(fontFamily: CustomLabels.primaryFont, color: AppColors.iconColor, fontSize: 13),
                                                                                      ),
                                                                                    );
                                                                                  }).toList(),
                                                                                  onChanged: (String? newValue) {
                                                                                    dropdownValue2 = newValue!;
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(top: 25),
                                                                                child: Row(children: [
                                                                                  Container(
                                                                                    width: screensize.width * 0.08,
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
                                                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 15,
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
                                                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                                                              });

                                                          //! ------------------------------------
                                                        },
                                                        child: const Row(
                                                          children: [
                                                            Icon(
                                                              Icons.edit,
                                                              size: 25,
                                                              color: AppColors
                                                                  .baseColor,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child:
                                                                  AutoSizeText(
                                                                'Edit',
                                                                maxLines: 1,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: AppColors
                                                                        .baseColor),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          //! ------ShowDilogue (delete)------------

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Dialog(
                                                                  backgroundColor:
                                                                      AppColors
                                                                          .lightGreyColor,
                                                                  child:
                                                                      SizedBox(
                                                                    width: screensize
                                                                            .width *
                                                                        0.3, // 80% of screen width
                                                                    height: screensize
                                                                            .height *
                                                                        0.35, // 50% of screen height

                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          color: AppColors
                                                                              .lightGreyColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15)),
                                                                      // height: screenHeight * 0.50,
                                                                      // width: screenWidth * 0.25,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                20.0,
                                                                            bottom:
                                                                                8,
                                                                            right:
                                                                                10,
                                                                            left:
                                                                                20),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
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
                                                                              Container(
                                                                                width: 50,
                                                                                height: 50,
                                                                                child: const Icon(
                                                                                  Icons.delete_outline_outlined,
                                                                                  size: 35,
                                                                                  color: AppColors.errorColor,
                                                                                ),
                                                                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 143, 66, 61)),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              const FittedBox(
                                                                                fit: BoxFit.contain,
                                                                                child: AutoSizeText(
                                                                                  'Delete user tenant unit',
                                                                                  maxLines: 1,
                                                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              const FittedBox(
                                                                                fit: BoxFit.contain,
                                                                                child: AutoSizeText(
                                                                                  'Are you sure you would like to do this?',
                                                                                  maxLines: 1,
                                                                                  style: TextStyle(color: Colors.white),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
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
                                                                                          "Cancel",
                                                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Container(
                                                                                    width: screensize.width * 0.12,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                          color: AppColors.errorColor,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        color: AppColors.errorColor,
                                                                                        borderRadius: BorderRadius.circular(8)),
                                                                                    child: const Center(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Text(
                                                                                          "Confirm",
                                                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              });

                                                          //! ------------------------------------
                                                        },
                                                        child: const Row(
                                                          children: [
                                                            Icon(
                                                              Icons.delete,
                                                              size: 25,
                                                              color: AppColors
                                                                  .errorColor,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child:
                                                                  AutoSizeText(
                                                                'Delete',
                                                                maxLines: 1,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: AppColors
                                                                        .errorColor),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                    thickness: 0.3,
                                  )
                                ],
                              );
                            }),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
