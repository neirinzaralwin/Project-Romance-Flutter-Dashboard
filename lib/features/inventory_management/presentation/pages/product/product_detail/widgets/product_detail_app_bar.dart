import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/configs/dimension/dimension_manager.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:project_romance/configs/theme/app_colors.dart';

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SliverAppBar(
      pinned: true,
      floating: true,
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      backgroundColor: AppColor.white,
      title: (screenWidth > DM.tabletview)
          ? FilledButton.tonalIcon(
              style: FilledButton.styleFrom(backgroundColor: AppColor.charcoal),
              onPressed: () => Navigator.pop(context),
              icon: FaIcon(FontAwesomeIcons.arrowLeft,
                  size: labelLarge.fontSize, color: AppColor.warmWhite),
              label: const Text(
                "Back",
                style: TextStyle(color: AppColor.warmWhite),
              ),
            )
          : IconButton.filled(
              style: IconButton.styleFrom(backgroundColor: AppColor.charcoal),
              onPressed: () => Navigator.pop(context),
              icon: FaIcon(FontAwesomeIcons.arrowLeft,
                  size: labelLarge.fontSize, color: AppColor.warmWhite),
            ),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColor.mildGreen,
            side: const BorderSide(width: 2.0, color: AppColor.greenColor),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Save & create new",
            style: TextStyle(color: AppColor.black),
          ),
        ),
        const SizedBox(width: 10),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: AppColor.greenDark),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Save",
            style: TextStyle(color: AppColor.warmWhite),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
