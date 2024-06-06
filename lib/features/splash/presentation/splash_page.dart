import 'package:flutter/material.dart';
import 'package:pos_admin/core/routes/router.dart';
import '../../../core/common/images/images_constant.dart';
import '../../../core/utils/device_dimension.dart';

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
    Future.delayed(Duration(seconds: 3), () {
     router.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Image.asset(
        height: DeviceUtils.getDeviceDimension(context).height,
        width: DeviceUtils.getDeviceDimension(context).width,
        AppImages.splashImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
