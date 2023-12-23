import 'package:flutter/material.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';

class SubMenuTitle extends StatelessWidget {
  final String title;
  const SubMenuTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: headlineSmall.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
