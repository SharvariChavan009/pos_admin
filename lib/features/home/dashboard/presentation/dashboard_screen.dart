import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // !------------------------------------
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    print("Screen Height: $screenHeight");
    print("Screen Width: $screenWidth");

    // !------------------------------------

    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Row(
        children: [
          //! Container 1
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 40, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
                height: screenHeight * 0.12,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://example.com/profile_photo.jpg'), // Replace with your image URL or use AssetImage for local images
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.contain,
                                      child: AutoSizeText(
                                        'Welcome',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 0),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.contain,
                                      child: AutoSizeText(
                                        'Super Admin',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: AppColors.iconColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                              width: 0.3,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 5, left: 9, right: 9),
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.exit_to_app,
                                    color: AppColors.iconColor,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const FittedBox(
                                    fit: BoxFit.contain,
                                    child: AutoSizeText(
                                      'Sign out',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //! Container 2

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 10, right: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
                height: screenHeight * 0.12,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: AutoSizeText(
                                      'filament',
                                      maxLines: 1,
                                      style: TextStyle(
                                          letterSpacing: 2,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: AutoSizeText(
                                      'v3.2.83',
                                      maxLines: 1,
                                      style:
                                          TextStyle(color: AppColors.iconColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.auto_stories,
                                    color: AppColors.iconColor,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const FittedBox(
                                    fit: BoxFit.contain,
                                    child: AutoSizeText(
                                      'Documentation',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/icons/github.512x489.png",
                                    color: AppColors.iconColor,
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const FittedBox(
                                    fit: BoxFit.contain,
                                    child: AutoSizeText(
                                      'GitHub',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
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
          ),
        ],
      ),
    );
  }
}
