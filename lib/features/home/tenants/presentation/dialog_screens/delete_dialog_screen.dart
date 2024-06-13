import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pos_admin/core/common/colors.dart';

class DeleteDialog extends StatefulWidget {
  const DeleteDialog({super.key});

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const double minHeight = 42.0;
    const double minWidth = 200.0;

    print("Screen Width: $screenWidth");
    print("Screen Height: $screenHeight");
    return Dialog(
      backgroundColor: AppColors.lightGreyColor,
      child: SizedBox(
        width: screensize.width * 0.3, // 80% of screen width
        height: screensize.height * 0.35, // 50% of screen height

        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(15)),
          // height: screenHeight * 0.50,
          // width: screenWidth * 0.25,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 8, right: 10, left: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.delete_outline_outlined,
                      size: 35,
                      color: AppColors.errorColor,
                    ),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 143, 66, 61)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const FittedBox(
                    fit: BoxFit.contain,
                    child: AutoSizeText(
                      'Delete user tenant unit',
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const FittedBox(
                    fit: BoxFit.contain,
                    child: AutoSizeText(
                      'Are you sure you would like to do this?',
                      maxLines: 1,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screensize.width * 0.12,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 0.5,
                            ),
                            color: AppColors.lightGreyColor,
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
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: screensize.width * 0.12,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.errorColor,
                              width: 0.5,
                            ),
                            color: AppColors.errorColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
    );
  }
}
