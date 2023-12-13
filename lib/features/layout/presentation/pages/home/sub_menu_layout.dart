// import 'package:flutter/material.dart';
// import 'package:project_romance/configs/routes/app_pages.dart';
// import 'package:project_romance/configs/routes/app_routes.dart';
// import 'package:project_romance/features/layout/presentation/pages/home/sub_menu_widgets/inventory_sub_menu.dart';

// import '../../../../../configs/theme/app_colors.dart';

// class SubMenuLayout extends StatefulWidget {
//   final int selectedIndex;
//   const SubMenuLayout({super.key, required this.selectedIndex});

//   @override
//   State<SubMenuLayout> createState() => _SubMenuLayoutState();
// }

// class _SubMenuLayoutState extends State<SubMenuLayout> {
//   @override
//   void initState() {
//     debugPrint("current index : ${widget.selectedIndex}");
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(7.5, 10, 3.25, 0),
//       width: 220,
//       decoration: BoxDecoration(color: AppColor.warmWhite, boxShadow: [
//         BoxShadow(
//           color: AppColor.black.withOpacity(0.1), spreadRadius: 3, blurRadius: 10,
//           offset: const Offset(0, -3), // changes position of shadow
//         )
//       ]),
//       child: buildSubMenu(index: widget.selectedIndex),
//     );
//   }

//   Widget buildSubMenu({required int index}) {
//     switch (index) {
//       case 0:
//         AppPages.router.goNamed(AppRoutes.welcome);
//         return ListView();
//       case 1:
//         return const InventorySubMenu();
//       default:
//         return ListView();
//     }
//   }
// }
