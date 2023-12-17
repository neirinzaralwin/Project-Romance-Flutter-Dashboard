import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:project_romance/configs/text_style/custom_text_style.dart';
import 'package:project_romance/configs/theme/app_colors.dart';

class ProductDetailCategory extends StatefulWidget {
  const ProductDetailCategory({
    super.key,
  });

  @override
  State<ProductDetailCategory> createState() => _ProductDetailCategoryState();
}

class _ProductDetailCategoryState extends State<ProductDetailCategory> {
  List<String> categoryList = [
    'Developer',
    'Designer',
    'Consultant',
    'Student',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: bodyLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(15),
          width: 450,
          decoration: BoxDecoration(border: Border.all(width: 1, color: AppColor.black.withOpacity(0.1)), borderRadius: BorderRadius.circular(10)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Container(
                constraints: const BoxConstraints(minWidth: 200),
                child: CustomDropdown<String>.search(
                  hintText: 'Select a category',
                  items: categoryList,
                  hintBuilder: (context, hint) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          hint,
                          style: bodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.primaryColor),
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
                          style: bodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.charcoal),
                        )
                      ],
                    );
                  },
                  errorStyle: bodyMedium.copyWith(color: AppColor.redColor),
                  excludeSelected: true,
                  noResultFoundText: "No category found",
                  closedFillColor: AppColor.secondaryColor,
                  expandedFillColor: AppColor.secondaryColor,
                  onChanged: (value) {
                    debugPrint('changing value to: $value');
                  },
                ),
              ),
            ),
            const SizedBox(width: 15),
            FilledButton.tonal(
              style: FilledButton.styleFrom(backgroundColor: AppColor.greenDark),
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Create one",
                style: bodyMedium.copyWith(color: AppColor.warmWhite),
              ),
            )
          ]),
        ),
      ],
    );
  }
}
