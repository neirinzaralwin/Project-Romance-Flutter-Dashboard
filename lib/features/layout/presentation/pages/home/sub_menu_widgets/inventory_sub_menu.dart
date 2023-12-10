import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_romance/configs/routes/app_pages.dart';
import 'package:project_romance/configs/routes/app_routes.dart';
import 'package:project_romance/features/layout/presentation/bloc/layout_bloc.dart';
import 'package:project_romance/features/layout/presentation/bloc/layout_state.dart';
import 'package:project_romance/features/layout/presentation/pages/home/sub_menu_widgets/widgets/sub_menu_title.dart';

import '../../../../../../configs/text_style/custom_text_style.dart';
import '../../../../../../configs/theme/app_colors.dart';

class InventorySubMenu extends StatefulWidget {
  const InventorySubMenu({super.key});

  @override
  State<InventorySubMenu> createState() => _InventorySubMenuState();
}

class _InventorySubMenuState extends State<InventorySubMenu> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      children: [
        const SubMenuTitle(title: "Inventory"),
        Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.white, boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.1), spreadRadius: 1, blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            )
          ]),
          child: BlocBuilder<LayoutBloc, LayoutState>(
            builder: (c, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Text("MANAGE", style: bodyMedium.copyWith(fontWeight: FontWeight.bold))),
                  const SizedBox(height: 15),
                  _fillButton("Products", () {
                    AppPages.router.goNamed(AppRoutes.allProduct);
                    // c.read<LayoutBloc>().add(ChangeMainScreenEvent(const AllProductScreen()));
                    setState(() {
                      currentIndex = 0;
                    });
                  }, 0),
                  const SizedBox(height: 10),
                  _fillButton("Categories", () {
                    AppPages.router.goNamed(AppRoutes.allCategory);
                    // c.read<LayoutBloc>().add(ChangeMainScreenEvent(const AllCategoriesScreen()));
                    setState(() {
                      currentIndex = 1;
                    });
                  }, 1),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  FilledButton _fillButton(String text, VoidCallback onPressed, index) {
    return FilledButton(
        style: FilledButton.styleFrom(
            textStyle: labelLarge, backgroundColor: currentIndex == index ? AppColor.greenColor : AppColor.mildGreen, foregroundColor: AppColor.charcoal),
        onPressed: onPressed,
        child: Text(text));
  }
}
