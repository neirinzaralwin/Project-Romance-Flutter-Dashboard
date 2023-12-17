import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../configs/text_style/custom_text_style.dart';
import '../../../../../../configs/theme/app_colors.dart';

class ProductRelatedScreen extends StatelessWidget {
  const ProductRelatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColor.warmWhite),
      width: 300,
      height: double.maxFinite,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text("Related", style: headlineSmall.copyWith(color: AppColor.greenDark)),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.circle, size: labelLarge.fontSize, color: AppColor.blueColor),
                const SizedBox(width: 10),
                Text("Steps to create a product", style: labelLarge),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.one, size: labelLarge.fontSize, color: AppColor.greenDark),
                const SizedBox(width: 10),
                FilledButton(
                    style: FilledButton.styleFrom(textStyle: labelLarge, backgroundColor: AppColor.mildGreen, foregroundColor: AppColor.charcoal),
                    onPressed: () => [],
                    child: const Text("Create Category", style: TextStyle(color: AppColor.black))),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.two, size: labelLarge.fontSize, color: AppColor.greenDark),
                const SizedBox(width: 10),
                FilledButton(
                    style: FilledButton.styleFrom(textStyle: labelLarge, backgroundColor: AppColor.greenColor, foregroundColor: AppColor.charcoal),
                    onPressed: () => [],
                    child: const Text("Create Brand", style: TextStyle(color: AppColor.black))),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.three, size: labelLarge.fontSize, color: AppColor.greenDark),
                const SizedBox(width: 10),
                FilledButton(
                    style: FilledButton.styleFrom(textStyle: labelLarge, backgroundColor: AppColor.greenDark, foregroundColor: AppColor.warmWhite),
                    onPressed: () => [],
                    child: const Text("Create Product")),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
