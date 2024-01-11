import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';

class SupportDescriptionWidget extends StatefulWidget {
  const SupportDescriptionWidget({super.key});

  @override
  State<SupportDescriptionWidget> createState() =>
      _SupportDescriptionWidgetState();
}

class _SupportDescriptionWidgetState extends State<SupportDescriptionWidget> {
  final description = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 450,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Description",
                style: headlineSmall.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton.filledTonal(
                  onPressed: () => [],
                  icon: const FaIcon(
                    FontAwesomeIcons.circlePlus,
                    color: AppColor.greenDark,
                  ))
            ],
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
