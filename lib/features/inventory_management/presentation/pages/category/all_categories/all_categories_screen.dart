import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_romance/configs/text_style/custom_text_style.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/di/service_locator.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_bloc.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_event.dart';
import 'widgets/all_categories_appbar_widget.dart';
import 'widgets/all_categories_header_widget.dart';
import 'widgets/all_categories_list_view.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  final columnHeadStyle = labelLarge.copyWith(color: AppColor.warmWhite);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPagePadding = screenWidth * 0.03;
    return BlocProvider<AllCategoryBloc>(
      create: (context) => sl<AllCategoryBloc>()..add(const GetAllCategoryEvent()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            AllCategoryAppBarWidget(horizontalPagePadding: horizontalPagePadding),
            AllCategoryHeaderWidget(horizontalPagePadding: horizontalPagePadding, columnHeadStyle: columnHeadStyle),
            const AllCategoryListView()
          ],
        ),
      ),
    );
  }
}
