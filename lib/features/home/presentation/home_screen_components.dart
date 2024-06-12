import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_admin/core/common/widgets/c_searchbar.dart';
import 'package:pos_admin/core/common/widgets/w_custom_button.dart';
import 'package:pos_admin/features/home/dashboard/presentation/dashboard_screen.dart';
import 'package:pos_admin/features/home/permissions/presentation/new_permission_creation.dart';
import 'package:pos_admin/features/home/presentation/bloc/menu_name_bloc.dart';
import 'package:pos_admin/features/home/presentation/bloc/menu_name_state.dart';
import 'package:pos_admin/features/home/roles/presentation/new_role_creation.dart';
import 'package:pos_admin/features/home/roles/presentation/role_list.dart';
import 'package:pos_admin/features/home/permissions/presentation/permission_list.dart';
import 'package:pos_admin/features/home/tenants/presentation/new_tenant_creation.dart';
import '../../../core/common/colors.dart';
import '../../../core/common/widgets/label.dart';
import '../../../core/utils/device_dimension.dart';
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
              if (state is MenuNameFetchedSuccess) {
                print("menu name =${state.name}");
                menuName = state.name;
              }
              if (state is MenuNameInitial) {
                print("menu name =");
                // menuName = state.name;
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  menuName == "Dashboard" || menuName == ""
                      ? dashboardHeaderPart(context)
                      : headerPart(context),
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
                  mainMenuName = state.name;
                  print("mainMenuName=${mainMenuName}");
                  if (state.name == "User" || state.name == "Tenants" || state.name == "Roles" || state.name == "Permissions") {
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
                              mainMenuName == "Roles" ||
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
                              print("button text  = ${Name} , text =${buttonText(Name)}");
                              switch (Name){
                                case "View":
                                  BlocProvider.of<MenuNameBloc>(context).add(
                                      MenuNameSelected(
                                          context: context, menuName: 'Edit'));
                                      break;
                                case "Tenants":
                                  if(buttonText(Name) == "New Tenants"){
                                    BlocProvider.of<MenuNameBloc>(context).add(
                                        MenuNameSelected(
                                            context: context,
                                            menuName: 'Create Tenant'));
                                  }
                                  break;
                                case "Roles":
                                  if(buttonText(Name) == "New Roles"){
                                    BlocProvider.of<MenuNameBloc>(context).add(
                                        MenuNameSelected(
                                            context: context,
                                            menuName: 'Create Role'));
                                  }
                                case "Permissions":
                                  if(buttonText(Name) == "New Permissions"){
                                    BlocProvider.of<MenuNameBloc>(context).add(
                                        MenuNameSelected(
                                            context: context,
                                            menuName: 'Create Permission'));
                                  }
                                  break;

                                default:
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
    case "Create Tenant":
      return "";
    case "Create Role":
      return "";
    case "Create Permission":
      return "";
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
                    height: 50,
                    color: AppColors.darkColor,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20.0, left: 10),
                          child: SizedBox(
                            height: 40,
                            width: 250,
                            child: CommonSearchBar(),
                          ),
                        )
                      ],
                    ),
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
            case "Create Tenant":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: NewTenantCreation(),
                  )
                ],
              );
            case "Dashboard":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: DashboardScreen(),
                  )
                ],
              );
            case "Tenants":
              return Column(
                children: [
                  Container(
                    height: 50,
                    color: AppColors.darkColor,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20.0, left: 10),
                          child: SizedBox(
                            height: 40,
                            width: 250,
                            child: CommonSearchBar(),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TenantListSetting(),
                    //! child: NewTenantCreation(),
                  )
                ],
              );
            case "Roles" || "Create Role":
              return const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: RoleListSetting(),
                    //! child: NewRoleCreation(),
                  )
                ],
              );
            case "Permissions" || "Create Permission":
              return Column(
                children: [
                  Container(
                    height: 50,
                    color: AppColors.darkColor,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20.0, left: 10),
                          child: SizedBox(
                            height: 40,
                            width: 250,
                            child: CommonSearchBar(),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 11,
                    child: PermisionListSetting(),
                    //! child: NewPermissionCreation(),
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
                    child: DashboardScreen(),
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
