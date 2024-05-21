import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item.dart';
import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/images/images_constant.dart';
import 'package:pos_admin/features/home/home_component/drawer/setting.dart';

import '../../../../core/common/colors.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  SidebarPageState createState() => SidebarPageState();
}

class SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  final AssetImage _avatarImg =  AssetImage(AppImages.backgroundImage);

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        // iconImage: AllIcons.home,
        isSelected: true,
        onPressed: () {
          // BlocProvider.of<MenuNameBloc>(context)
          //     .add(MenuNameSelected(context: context, menuName: "Home"));
        },
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Face"))),
      ),
      CollapsibleItem(
        text: 'User',
        // iconImage: AllIcons.menu,
        onPressed: () {
          // BlocProvider.of<MenuNameBloc>(context)
          //     .add(MenuNameSelected(context: context, menuName: "Menu"));
        },
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Face"))),
      ),
      CollapsibleItem(
        text: 'Tenants',
        // iconImage: AllIcons.order,
        onPressed: () {
          // BlocProvider.of<MenuNameBloc>(context)
          //     .add(MenuNameSelected(context: context, menuName: "Orders"));
          // BlocProvider.of<OrderListBloc>(context).add(OrderListShowEvent());
        },
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Face"))),
      ),
      CollapsibleItem(
        text: 'Tax',
        // iconImage: AllIcons.payment,
        onPressed: () {
          // BlocProvider.of<MenuNameBloc>(context)
          //     .add(MenuNameSelected(context: context, menuName: "Payment"));
        },
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Face"))),
      ),
      CollapsibleItem(
        text: 'Roles',
        // iconImage: AllIcons.olOrder,
        onPressed: () {
          // BlocProvider.of<MenuNameBloc>(context).add(
          //     MenuNameSelected(context: context, menuName: "Online Orders"));
        },
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Face"))),
      ),
      CollapsibleItem(
        text: 'Permissions',
        // iconImage: AllIcons.table_check,
        onPressed: () {
          // BlocProvider.of<MenuNameBloc>(context).add(
          //     MenuNameSelected(context: context, menuName: "Staff Attendance"));
        },
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Face"))),
      ),
      CollapsibleItem(
        text: 'Logout',
        // iconImage: AllIcons.setting,
        onPressed: () {
          // BlocProvider.of<MenuNameBloc>(context)
          //     .add(MenuNameSelected(context: context, menuName: "Setting"));
        },
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Face"))),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            CollapsibleSidebar(
              height: MediaQuery.of(context).size.height,
              itemPadding: 10,
              screenPadding: 0,
              customItemOffsetX: 1,
              borderRadius: 0,
              maxWidth: 220,
              customContentPaddingLeft: 0,
              curve: Curves.fastOutSlowIn,
              isCollapsed: MediaQuery.of(context).size.width <= 1000,
              items: _items,
              onHoverPointer: MaterialStateMouseCursor.clickable,
              // avatarImg: _avatarImg,
              showTitle: false,
              duration: const Duration(milliseconds: 200),
              onTitleTap: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
              },
              body: _body(size, context),
              backgroundColor: AppColors.primaryColor,
              topPadding: 140,
              selectedTextColor: AppColors.secondaryColor,
              textStyle:
                  const TextStyle(fontSize: 15, fontStyle: FontStyle.normal),
              titleStyle: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
              toggleTitleStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              sidebarBoxShadow: const [
                BoxShadow(
                  color: Colors.indigo,
                  blurRadius: 5,
                  spreadRadius: 0.01,
                  offset: Offset(.1, .1),
                ),
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 2,
                  spreadRadius: 0.01,
                  offset: Offset(.1, .1),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 15,
              child: Center(
                child: SizedBox(
                  height: 100,
                  width: 60,
                  child: Image.asset(AppImages.backgroundImage),
                ),
              ),
            ),
            const Positioned(
              bottom: 100,
              left: 25,
              child: Center(
                child: RotatingSvgIcon(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      // width: double.infinity,
      color: Colors.blueGrey[50],
    );
  }
}
