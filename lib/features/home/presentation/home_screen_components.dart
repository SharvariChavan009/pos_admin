import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/widgets/w_custom_button.dart';
import 'package:pos_admin/features/home/presentation/bloc/menu_name_bloc.dart';
import 'package:pos_admin/features/home/presentation/bloc/menu_name_state.dart';
import '../../../core/common/colors.dart';
import '../../../core/common/widgets/label.dart';
import '../../../core/utils/device_dimension.dart';
import '../roles/presentation/role_list.dart';
import '../tenants/presentation/tenant_list.dart';
import '../users/presentation/new_user_creation.dart';
import '../users/presentation/user_list.dart';
import 'bloc/menu_name_event.dart';
import 'home_page.dart';

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
          child: BlocBuilder<MenuNameBloc, MenuNameState>(
            builder: (context, state) {
              String menuName = "";
              if (state is MenuNameFetchedSuccess){
                print("menu name =${state.name}");
                menuName = state.name;
              }
              if(state is MenuNameInitial){
                print("menu name =");
                // menuName = state.name;
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  menuName == "Dashboard" || menuName == "" ? dashboardHeaderPart(context) : headerPart(context),
                  middleBody(tabController),
                ],
              );
            },
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
                String? mainMenuName = "";
                if (state is MenuNameFetchedSuccess) {
                  print(state.name);
                  mainMenuName = state.name;
                  if (state.name == "User" || state.name == "Tenants") {
                    Name = "List";
                  } else {
                    Name = state.name;
                  }
                }
                return Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Visibility(
                        visible: (mainMenuName == "User" ||
                                mainMenuName == 'Tenants' ||
                                mainMenuName == 'Roles' ||
                                mainMenuName == "Permissions")
                            ? true
                            : false,
                        child: Text(
                          mainMenuName,
                          style: const TextStyle(
                            letterSpacing: .8,
                            color: AppColors.whiteColor,
                            fontFamily: CustomLabels.primaryFont,
                            fontWeight: CustomLabels.mediumFontWeight,
                            fontSize: 18,
                          ),
                        )),
                    const SizedBox(width: 5),
                    InkWell(
                      child: (mainMenuName == "User" ||
                              mainMenuName == "Tenants" ||
                              mainMenuName == "Roles"||
                              mainMenuName == "Permissions")
                          ? const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: AppColors.iconColor,
                              size: 16,
                            )
                          : const Icon(
                              Icons.arrow_back,
                              color: AppColors.iconColor,
                              size: 16,
                            ),
                      onTap: () {
                        print("mainMenuName = ${HomePage.currentMenu}");
                        mainMenuName = HomePage.currentMenu;
                        switch (mainMenuName) {
                          case "User":
                            BlocProvider.of<MenuNameBloc>(context).add(
                                MenuNameSelected(
                                    context: context, menuName: 'User'));
                            break;
                          case "Tenants":
                            BlocProvider.of<MenuNameBloc>(context).add(
                                MenuNameSelected(
                                    context: context, menuName: 'Tenants'));
                            break;
                          case "Roles":
                            BlocProvider.of<MenuNameBloc>(context).add(
                                MenuNameSelected(
                                    context: context, menuName: 'Roles'));
                            break;
                          default:
                            BlocProvider.of<MenuNameBloc>(context).add(
                                MenuNameSelected(
                                    context: context, menuName: 'User'));
                        }
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      Name == "" ? 'List' : Name,
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
                  BlocBuilder<MenuNameBloc, MenuNameState>(
                    builder: (context, state) {
                      String Name = "";
                      if (state is MenuNameFetchedSuccess) {
                        print(state.name);
                        if (state.name == "User") {
                          Name = "List";
                        } else {
                          Name = state.name;
                        }
                        print("name = $Name");
                      }
                      return Visibility(
                          visible: buttonText(Name) == "" ? false : true,
                          child: CustomButton(
                            minWidth: 50,
                            text: buttonText(Name),
                            activeButtonColor: Name == "Edit"
                                ? Colors.red
                                : AppColors.baseColor,
                            textStyle: CustomLabels.bodyTextStyle(
                                fontSize: 14, color: AppColors.whiteColor),
                            onPressed: () {
                              if (Name == "View") {
                                BlocProvider.of<MenuNameBloc>(context).add(
                                    MenuNameSelected(
                                        context: context, menuName: 'Edit'));
                              } else {
                                BlocProvider.of<MenuNameBloc>(context).add(
                                    MenuNameSelected(
                                        context: context,
                                        menuName: 'Create User'));
                              }
                            },
                          ));
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

String buttonText(String menuName) {
  switch (menuName) {
    case "List":
      return "New User";
    case "View":
      return "Edit";
    case "Create User":
      return "";
    case "Edit":
      return "Delete";
    default:
      return "New $menuName";
  }
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
            print("selcteduser = ${state.selectedUser?.name}");
          }
          switch (menuName) {
            case "User":
              return Column(
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
            case "View":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: NewUser(),
                  )
                ],
              );
            case "Edit":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: NewUser(),
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
              return Column(
                children: [
                  Container(
                    height: 40,
                    color: Colors.cyan,
                  ),
                  const Expanded(
                    child: TenantListSetting(),
                  )
                ],
              );
            case "Roles":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: RoleListSetting(),
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
              return const Column(
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

Widget dashboardHeaderPart(context) {
  return Expanded(
    flex: 1,
    child: Container(
      margin: const EdgeInsets.only(left: 5),
      color: AppColors.primaryColor,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 25,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Visibility(
                    visible: true,
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                        letterSpacing: .8,
                        color: AppColors.whiteColor,
                        fontFamily: CustomLabels.primaryFont,
                        fontWeight: CustomLabels.mediumFontWeight,
                        fontSize: 20,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
