import 'package:auto_size_text/auto_size_text.dart';
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
import 'order_list.dart';

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
            child: AutoSizeText(
              'User',
              textAlign: TextAlign.left,
              minFontSize: 12,
              maxFontSize: 16,
              style: CustomLabels.textTextStyle(
                  color: AppColors.whiteColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              presetFontSizes: const [24],
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
          if (state is MenuNameFetchedSuccess){
            menuName = state.name;
          }
          switch(menuName){
            case "User":
              return  const Column(
              children: [
                Expanded(
                  child: MenuListSetting(),
                )
              ],
            );
            case "Dashboard":
              return  const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Text("Tables list"),
                  )
                ],
              );
            case "Tenants":
              return  const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Text("Tables list"),
                  )
                ],
              );
            case "Roles":
              return  const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Text("Tables list"),
                  )
                ],
              );
              case "Permissions":
                return  const Column(
                  children: [
                    Expanded(
                      flex: 11,
                      child: Text("Tables list"),
                    )
                  ],
                );
            case "Logout":
              return  const Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Text("Tables list"),
                  )
                ],
              );
            default:
              return  const Column(
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
