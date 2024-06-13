import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/common/widgets/c_text_field.dart';
import 'package:pos_admin/core/common/widgets/label.dart';
import 'package:pos_admin/features/home/tenants/presentation/dialog_screens/delete_dialog_screen.dart';
import 'package:pos_admin/features/home/tenants/presentation/dialog_screens/edit_dialog_screen.dart';
import 'package:pos_admin/features/home/tenants/presentation/dialog_screens/new_tenant_unit_dialog_screen.dart';
import 'package:pos_admin/features/home/users/presentation/new_user_creation.dart';

class EditTenantScreen extends StatefulWidget {
  const EditTenantScreen({super.key});

  @override
  State<EditTenantScreen> createState() => _EditTenantScreenState();
}

class _EditTenantScreenState extends State<EditTenantScreen> {
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
                //! container 1 -------------------

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Image",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),

                                            // Todo: Image picker code logic
                                            Container(
                                              width: 90,
                                              height: 90,
                                              child: InkWell(
                                                onTap: () {
                                                  print(
                                                      "Image picker clicked!");
                                                },
                                                child: const Icon(
                                                  Icons.camera_alt,
                                                  size: 30,
                                                  color: AppColors.iconColor,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black
                                                    .withOpacity(.2),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Website",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              CustomTextField(
                                                  controller: nameController,
                                                  width:
                                                      screensize.width * 0.3),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Tax Number",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                CustomTextField(
                                                  hintText: "E.g GST in India",
                                                  controller: nameController,
                                                  width:
                                                      screensize.width * 0.35,
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
                                                  activeColor:
                                                      AppColors.baseColor,
                                                  value: _switchValue,
                                                  onChanged: (value) {
                                                    _switchValue = value;
                                                  }),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "Active",
                                                style: TextStyle(
                                                    color: Colors.white),
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
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
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

                //! container 2 -------------------

                Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, left: 20, bottom: 8, top: 30),
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
                                'Tenant Units',
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
                                      return const NewTenatUnitDialogScreen();
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
                                      "New tenant units",
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
                          // Header ---------------------------------

                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            children: [
                                              //? Checkbox

                                              Checkbox(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                checkColor: Colors.white,
                                                fillColor: WidgetStateProperty
                                                    .all(isChecked == true
                                                        ? AppColors.baseColor
                                                        : AppColors.darkColor),
                                                value: isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
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
                                                  'Name',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 22.0),
                                            child: AutoSizeText(
                                              'Active',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: AutoSizeText(
                                            'Main Branch',
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 20.0),
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
                                  )),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.0, bottom: 10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.edit,
                                                    size: 25,
                                                    color: AppColors.darkColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: AutoSizeText(
                                                      'Edit',
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .darkColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.delete,
                                                    size: 25,
                                                    color: AppColors.darkColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: AutoSizeText(
                                                      'Delete',
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .darkColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.white,
                                thickness: 0.3,
                              )
                            ],
                          ),

                          // Header Completed -----------------------

                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: _itemCount,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
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
                                                      value: isChecked == false
                                                          ? _checked[index]
                                                          : isChecked,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked == false
                                                              ? _checked[
                                                                      index] =
                                                                  value!
                                                              : isChecked =
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
                                        const Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.check_circle_outline,
                                                size: 25,
                                                color: Colors.green,
                                              ),
                                              Icon(
                                                Icons.check_circle_outline,
                                                size: 25,
                                                color: Colors.green,
                                              ),
                                              FittedBox(
                                                fit: BoxFit.contain,
                                                child: AutoSizeText(
                                                  'Jaysingpur',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 10),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
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
                                                              return const NewEditTenantDialogScreen();
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
                                                            fit: BoxFit.contain,
                                                            child: AutoSizeText(
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
                                                              return const DeleteDialog();
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
                                                            fit: BoxFit.contain,
                                                            child: AutoSizeText(
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

                //! -------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
