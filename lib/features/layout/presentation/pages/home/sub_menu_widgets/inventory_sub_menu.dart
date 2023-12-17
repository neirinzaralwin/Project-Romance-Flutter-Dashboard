import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_romance/configs/dimension/dimension_manager.dart';
import 'package:project_romance/features/layout/presentation/pages/home/sub_menu_widgets/widgets/sub_menu_title.dart';

import '../../../../../../configs/text_style/custom_text_style.dart';
import '../../../../../../configs/theme/app_colors.dart';
import '../home_layout.dart';

class InventorySubMenu extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const InventorySubMenu({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        if (screenWidth > DM.tabletview)
          Container(
            margin: const EdgeInsets.fromLTRB(7.5, 10, 3.25, 0),
            width: 220,
            decoration: BoxDecoration(color: AppColor.warmWhite, boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1), spreadRadius: 3, blurRadius: 10,
                offset: const Offset(0, -3), // changes position of shadow
              )
            ]),
            child: ListView(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(child: Text("MANAGE", style: bodyMedium.copyWith(fontWeight: FontWeight.bold))),
                        const SizedBox(height: 15),
                        _fillButton("Products", () {
                          navigationShell.goBranch(0);
                        }, 0),
                        const SizedBox(height: 10),
                        _fillButton("Categories", () {
                          navigationShell.goBranch(1);
                        }, 1),
                      ],
                    )),
              ],
            ),
          ),
        Expanded(
            child: AnimatedBranchContainer(
          currentIndex: navigationShell.currentIndex,
          children: children,
        )),
      ]),
    );
  }

  FilledButton _fillButton(String text, VoidCallback onPressed, index) {
    return FilledButton(
        style: FilledButton.styleFrom(
            textStyle: labelLarge,
            backgroundColor: navigationShell.currentIndex == index ? AppColor.greenColor : AppColor.mildGreen,
            foregroundColor: AppColor.charcoal),
        onPressed: onPressed,
        child: Text(text));
  }
}
