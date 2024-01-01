import 'package:flutter/material.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class CustomSearchDropDown extends StatelessWidget {
  final List<String> items;
  final Color hintColor;
  final Color textColor;
  final Color selectedTextColor;
  final Color backgroundColor;
  final String noResultFoundText;
  final String hintText;
  final Function(String) onChanged;
  const CustomSearchDropDown(
      {super.key,
      required this.onChanged,
      required this.items,
      required this.hintColor,
      required this.textColor,
      required this.selectedTextColor,
      required this.backgroundColor,
      required this.noResultFoundText,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 200),
      child: CustomDropdown<String>.search(
        hintText: hintText,
        items: items,
        hintBuilder: (context, hint) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                hint,
                style: bodyMedium.copyWith(
                    fontWeight: FontWeight.bold, color: hintColor),
              )
            ],
          );
        },
        listItemBuilder: (context, item) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item,
                style: bodyMedium.copyWith(
                    fontWeight: FontWeight.bold, color: textColor),
              )
            ],
          );
        },
        headerBuilder: (context, item) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item,
                style: bodyMedium.copyWith(
                    fontWeight: FontWeight.bold, color: selectedTextColor),
              )
            ],
          );
        },
        errorStyle: bodyMedium.copyWith(color: AppColor.redColor),
        excludeSelected: true,
        noResultFoundText: noResultFoundText,
        closedFillColor: backgroundColor,
        expandedFillColor: backgroundColor,
        onChanged: onChanged,
      ),
    );
  }
}
