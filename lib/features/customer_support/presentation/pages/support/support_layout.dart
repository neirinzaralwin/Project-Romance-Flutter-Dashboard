import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_romance/configs/dimension/dimension_manager.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/di/service_locator.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/bloc/support_bloc.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/bloc/support_event.dart';
import 'widgets/support_contact_us_widget.dart';
import 'widgets/support_description_widget.dart';

class SupportLayout extends StatefulWidget {
  const SupportLayout({super.key});
  static final supportLayoutKey = GlobalKey<ScaffoldState>();
  @override
  State<SupportLayout> createState() => _SupportLayoutState();
}

class _SupportLayoutState extends State<SupportLayout> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider<SupportBloc>(
      create: (context) => sl<SupportBloc>()..add(const GetAllContactsEvent()),
      child: Scaffold(
          key: SupportLayout.supportLayoutKey,
          backgroundColor: AppColor.scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: const Color(0xff7a9793),
                  child: Image.asset(
                    "assets/images/support/support_image.jpg",
                    width: screenWidth,
                    height: getImageHeight(screenWidth),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(height: 10),
                const Wrap(
                  children: [
                    SupportContactUsWidget(),
                    SupportDescriptionWidget(),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          )),
    );
  }

  double getImageHeight(double screenWidth) {
    if (screenWidth <= DM.tabletview) return 300.0;
    return 500.0;
  }
}
