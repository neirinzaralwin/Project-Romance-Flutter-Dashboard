import 'package:flutter/material.dart';
import 'package:project_romance/configs/dimension/dimension_manager.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:project_romance/configs/theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: AppColor.black,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/images/welcome.jpeg",
              width: screenWidth,
              height: DM.screenHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome to",
                style: headlineMedium.copyWith(color: AppColor.white)),
            const SizedBox(height: 5),
            Text("Project Romance",
                style: headlineLarge.copyWith(
                    color: AppColor.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            FilledButton(onPressed: () => [], child: const Text("Get Started"))
          ],
        ))
      ],
    ));
  }
}
