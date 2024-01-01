import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/configs/routes/app_pages.dart';
import 'package:project_romance/configs/routes/app_routes.dart';
import 'package:project_romance/core/constants/app_constants.dart';
import 'package:project_romance/core/extensions/comma_format.dart';
import 'package:project_romance/features/inventory_management/domain/entities/product_entity.dart';

import '../../../../../../../configs/dimension/dimension_manager.dart';
import '../../../../../../../core/shared_components/text_style/custom_text_style.dart';
import '../../../../../../../configs/theme/app_colors.dart';

class AllProductListWidget extends StatefulWidget {
  final List<ProductEntity> products;
  const AllProductListWidget({super.key, required this.products});

  @override
  State<AllProductListWidget> createState() => _AllProductListWidgetState();
}

class _AllProductListWidgetState extends State<AllProductListWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double horizontalPagePadding = width * 0.03;
    return SliverList.builder(
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        ProductEntity product = widget.products[index];

        return InkWell(
          onTap: () => AppPages.router.goNamed(AppRoutes.productDetail),
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: horizontalPagePadding, vertical: 5),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.warmWhite,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withOpacity(0.1), spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(product.name ?? '',
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: labelLarge),
                ),
                const SizedBox(width: 10),
                Expanded(
                    flex: 2,
                    child: Text(
                        "${product.price.comma()} ${AppConst.currencyUnit}",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: labelLarge)),
                const SizedBox(width: 10),
                Expanded(
                    flex: 2,
                    child: Text("${product.stock}",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: labelLarge)),
                if (width > DM.tabletview) const SizedBox(width: 10),
                if (width > DM.tabletview)
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                              minWidth: 30,
                              maxWidth: 30,
                              minHeight: 30,
                              maxHeight: 30),
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.penToSquare,
                              size: labelLarge.fontSize,
                              color: AppColor.yellowColor),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                              minWidth: 30,
                              maxWidth: 30,
                              minHeight: 30,
                              maxHeight: 30),
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.trashCan,
                              size: labelLarge.fontSize,
                              color: AppColor.redColor),
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
