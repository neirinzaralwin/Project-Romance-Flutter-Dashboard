import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../core/shared_components/text_style/custom_text_style.dart';
import '../../../../../../../configs/theme/app_colors.dart';
import '../../../../../../../core/shared_components/custom_text_field.dart';

class AllProductAppBarWidget extends StatelessWidget {
  final double horizontalPagePadding;
  const AllProductAppBarWidget(
      {super.key, required this.horizontalPagePadding});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80.0,
      pinned: true,
      backgroundColor: AppColor.scaffoldBackgroundColor,
      // title: const Text("All Products"),
      // titleTextStyle: headlineLarge!.copyWith(color: AppColor.greenDark),
      actions: [
        SizedBox(width: horizontalPagePadding),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomTextFormField(
              text: "Search products",
              enableBorder: false,
              fillColor: AppColor.white,
              textColor: AppColor.black,
              iconColor: AppColor.black,
              labelColor: AppColor.black,
              cursorColor: AppColor.greenColor,
              hint: "Search products",
              enabledBorderColor: AppColor.white,
              controller: TextEditingController(),
              validator: null,
            ),
          ),
        ),
        const SizedBox(width: 10),
        FilledButton.tonalIcon(
          style: FilledButton.styleFrom(backgroundColor: AppColor.charcoal),
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.sliders,
              size: labelLarge.fontSize, color: AppColor.warmWhite),
          label: const Text(
            "Filter",
            style: TextStyle(color: AppColor.warmWhite),
          ),
        ),
        SizedBox(width: horizontalPagePadding),
      ],
    );
  }
}
