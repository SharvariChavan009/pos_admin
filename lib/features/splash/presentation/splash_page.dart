import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';
import 'package:pos_admin/core/routes/router.dart';
import '../../../core/common/images/images_constant.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to login screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      router.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Center(
        child: SizedBox(
          width: 400.0,
          child: TextLiquidFill(
            text: 'QuickDine',
            waveColor: Colors.blueAccent,
            boxBackgroundColor: AppColors.darkColor,
            textStyle: const TextStyle(
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 300.0,
          ),
        ),
      ),
    );
  }
}
