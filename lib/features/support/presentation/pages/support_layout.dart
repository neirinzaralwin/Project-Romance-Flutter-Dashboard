import 'package:flutter/material.dart';
import 'package:project_romance/configs/theme/app_colors.dart';

class SupportLayout extends StatefulWidget {
  const SupportLayout({super.key});

  @override
  State<SupportLayout> createState() => _SupportLayoutState();
}

class _SupportLayoutState extends State<SupportLayout> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/support/support_image.jpg",
              width: screenWidth,
              height: 500,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
