import 'package:flutter/material.dart';
import 'package:pos_admin/features/home/dashboard/presentation/dashboard_screen.dart';

import '../../../core/common/colors.dart';
import '../home_component/drawer/drawer.dart';
import 'home_screen_components.dart';

class HomePage extends StatefulWidget {
  static String? currentMenu = "";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
 
    tabController = TabController(length: 12, vsync: this);
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Row(
        children: [
          const SidebarPage(),
          buildContentColumn(context, tabController),
        ],
      ),
    );
  }
}
