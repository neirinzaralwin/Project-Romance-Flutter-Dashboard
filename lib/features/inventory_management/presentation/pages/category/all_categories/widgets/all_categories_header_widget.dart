import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_bloc.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_state.dart';

class AllCategoryHeaderWidget extends StatelessWidget {
  const AllCategoryHeaderWidget({
    super.key,
    required this.horizontalPagePadding,
    required this.columnHeadStyle,
  });

  final double horizontalPagePadding;
  final TextStyle columnHeadStyle;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: headlineLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.charcoal),
                    ),
                    BlocBuilder<AllCategoryBloc, AllCategoryState>(
                      builder: ((context, state) {
                        if (state is AllCategorySuccess) {
                          return Text(
                            "${state.paginatedAllCategories?.total ?? 0} categories",
                            style:
                                bodyMedium.copyWith(color: AppColor.thirdColor),
                          );
                        }
                        return const SizedBox.shrink();
                      }),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _responsiveButton(
                      text: "Create new",
                      iconData: FontAwesomeIcons.plus,
                      onPressed: () {},
                      screenWidth: screenWidth,
                    ),
                    const SizedBox(width: 10),
                    _responsiveButton(
                      text: "Export",
                      iconData: FontAwesomeIcons.fileExport,
                      onPressed: () {},
                      screenWidth: screenWidth,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.black.withOpacity(0.1), spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _expandedText("ID", 2),
                  const SizedBox(width: 10),
                  _expandedText("Name", 5),
                  const SizedBox(width: 10),
                  _expandedText("Actions", 3),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _responsiveButton(
      {required String text,
      required IconData iconData,
      required VoidCallback onPressed,
      required double screenWidth}) {
    if (screenWidth > 900) {
      return FilledButton.icon(
        style: FilledButton.styleFrom(backgroundColor: AppColor.charcoal),
        onPressed: onPressed,
        icon: FaIcon(iconData, size: labelLarge.fontSize),
        label: Text(text),
      );
    }
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.charcoal,
            borderRadius: BorderRadius.circular(50),
          ),
          child: FaIcon(iconData,
              size: labelLarge.fontSize, color: AppColor.warmWhite)),
    );
  }

  Expanded _expandedText(text, flex) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: columnHeadStyle,
      ),
    );
  }
}
