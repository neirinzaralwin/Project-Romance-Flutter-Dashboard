import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/features/inventory_management/domain/entities/category_entity.dart';
import '../../../../../../../configs/text_style/custom_text_style.dart';
import '../../../../../../../configs/theme/app_colors.dart';

class AllCategoryListWidget extends StatefulWidget {
  final List<CategoryEntity> categories;
  const AllCategoryListWidget({super.key, required this.categories});

  @override
  State<AllCategoryListWidget> createState() => _AllCategoryListWidgetState();
}

class _AllCategoryListWidgetState extends State<AllCategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double horizontalPagePadding = width * 0.03;
    return SliverList.builder(
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        CategoryEntity category = widget.categories[index];

        return InkWell(
          onTap: () => [],
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: horizontalPagePadding, vertical: 5),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColor.warmWhite, boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1), spreadRadius: 1, blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(category.id.toString(), textAlign: TextAlign.start, maxLines: 2, overflow: TextOverflow.ellipsis, style: labelLarge),
                ),
                const SizedBox(width: 10),
                Expanded(
                    flex: 5, child: Text(category.name ?? "", textAlign: TextAlign.start, maxLines: 2, overflow: TextOverflow.ellipsis, style: labelLarge)),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30),
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.penToSquare, size: labelLarge.fontSize, color: AppColor.yellowColor),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30),
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.trashCan, size: labelLarge.fontSize, color: AppColor.redColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
