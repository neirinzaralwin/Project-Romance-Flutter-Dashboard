import 'package:flutter/material.dart';
import 'package:project_romance/configs/routes/app_pages.dart';
import 'package:project_romance/configs/theme/app_themes.dart';
import 'package:project_romance/core/constants/app_constants.dart';

import 'di/service_locator.dart';

void main() async {
  await serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConst.appName,
      debugShowCheckedModeBanner: false,
      theme: customAppTheme,
      routerConfig: AppPages.router,
    );
  }
}
