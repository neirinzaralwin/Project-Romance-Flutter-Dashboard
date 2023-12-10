import 'package:flutter/material.dart';
import 'package:project_romance/configs/theme/app_colors.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.primaryColor, title: const Text("All categories")),
      body: Container(),
    );
  }
}
