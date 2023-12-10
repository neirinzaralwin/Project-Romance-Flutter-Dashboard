import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_romance/configs/dimension/dimension_manager.dart';
import 'package:project_romance/configs/text_style/custom_text_style.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/di/service_locator.dart';
import '../product_related/product_related_screen.dart';
import 'bloc/all_product_bloc.dart';
import 'bloc/all_product_event.dart';
import 'widgets/all_product_appbar_widget.dart';
import 'widgets/all_product_header_widget.dart';
import 'widgets/all_product_list_view.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final columnHeadStyle = labelLarge.copyWith(color: AppColor.warmWhite);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPagePadding = screenWidth * 0.03;
    return BlocProvider<AllProductBloc>(
      create: (context) => sl<AllProductBloc>()..add(const GetAllProductsEvent()),
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  AllProductAppBarWidget(horizontalPagePadding: horizontalPagePadding),
                  AllProductHeaderWidget(horizontalPagePadding: horizontalPagePadding, columnHeadStyle: columnHeadStyle),
                  const AllProductListView()
                ],
              ),
            ),
            if (screenWidth >= DM.ultrawideview) const ProductRelatedScreen(),
          ],
        ),
      ),
    );
  }
}
