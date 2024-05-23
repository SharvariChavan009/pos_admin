import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/widgets/w_custom_button.dart';
import 'package:pos_admin/features/home/presentation/bloc/menu_name_bloc.dart';
import 'package:pos_admin/features/home/presentation/bloc/menu_name_state.dart';
import '../../../core/common/colors.dart';
import '../../../core/common/images/images_constant.dart';
import '../../../core/common/widgets/icon.dart';
import '../../../core/common/widgets/label.dart';
import '../../../core/utils/device_dimension.dart';
import '../users/presentation/new_user_creation.dart';
import '../users/presentation/user_list.dart';
import 'bloc/menu_name_event.dart';

Widget buildContentColumn(context, TabController tabController) {
  return Expanded(
    flex: (DeviceUtils.getDeviceDimension(context).width) > 1000
        ? 10
        : (DeviceUtils.getDeviceDimension(context).width) > 900
            ? 8
            : 6,
    child: Column(
      children: [
        SizedBox(
          height: DeviceUtils.getDeviceDimension(context).height,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              headerPart(context),
              middleBody(tabController),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget headerPart(context) {
  return Expanded(
    flex: 1,
    child: Container(
      margin: const EdgeInsets.only(left: 5),
      color: AppColors.primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 25,
          ),
          Expanded(
            flex: 2,
            child: BlocBuilder<MenuNameBloc, MenuNameState>(
              builder: (context, state) {
                String Name = "";
                String Listname = "";
                if(state is MenuNameFetchedSuccess){

                  print(state.name);
                  if (state.name == "User"){
                    Name = "List";
                  }else{
                    Name = state.name;
                  }
                }
                return Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<MenuNameBloc>(context).add(
                            MenuNameSelected(
                                context: context, menuName: 'User'));
                     },
                        child: const Text(
                      'Users',
                      style: TextStyle(
                        letterSpacing: .8,
                        color: AppColors.whiteColor,
                        fontFamily: CustomLabels.primaryFont,
                        fontWeight: CustomLabels.mediumFontWeight,
                        fontSize: 18,
                      ),
                    )
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.iconColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     Text(
                      Name == "" ? 'List': Name,
                      style: const TextStyle(
                        letterSpacing: .8,
                        color: AppColors.whiteColor,
                        fontFamily: CustomLabels.primaryFont,
                        fontWeight: CustomLabels.mediumFontWeight,
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: DeviceUtils.getDeviceDimension(context).width > 1000 ? 4 : 0,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    minWidth: 50,
                    text: 'New User',
                    activeButtonColor: AppColors.baseColor,
                    textStyle: CustomLabels.bodyTextStyle(
                        fontSize: 14, color: AppColors.whiteColor),
                    onPressed: () {
                      BlocProvider.of<MenuNameBloc>(context).add(
                          MenuNameSelected(
                              context: context, menuName: 'Create User'));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget middleBody(TabController tabController) {
  return Expanded(
    flex: 10,
    child: Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        // color: Colors.yellow,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: BlocBuilder<MenuNameBloc, MenuNameState>(
        builder: (context, state) {
          String menuName = "";
          if (state is MenuNameFetchedSuccess) {
            menuName = state.name;
          }
          switch (menuName) {
            case "User":
              return  Column(
                children: [
                  Container(
                    height: 40,
                    color: Colors.cyan,
                  ),
                  const Expanded(
                    child: UserListSetting(),
                  )
                ],
              );
            case "Dashboard":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Text("Tables list"),
                  )
                ],
              );
            case "Tenants":
              return  Column(
                children: [
                  Container(
                    height: 40,
                    color: Colors.cyan,
                  ),
                  const Expanded(
                    child: UserListSetting(),
                  )
                ],
              );
            case "Roles":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Text("Tables list"),
                  )
                ],
              );
            case "Permissions":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Text("Tables list"),
                  )
                ],
              );
            case "Logout":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Text("Tables list"),
                  )
                ],
              );
            case "Create User":
              return  const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: NewUser(),
                  )
                ],
              );
            default:
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Text("Tables list"),
                  )
                ],
              );
          }
        },
      ),
    ),
  );
}
