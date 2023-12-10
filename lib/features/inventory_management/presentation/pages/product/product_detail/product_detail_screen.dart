import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/configs/text_style/custom_text_style.dart';

import '../../../../../../configs/theme/app_colors.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.all(10),
            child: FilledButton.tonalIcon(
              style: FilledButton.styleFrom(backgroundColor: AppColor.charcoal),
              onPressed: () => Navigator.pop(context),
              icon: FaIcon(FontAwesomeIcons.arrowLeft, size: labelLarge.fontSize, color: AppColor.warmWhite),
              label: const Text(
                "Back",
                style: TextStyle(color: AppColor.warmWhite),
              ),
            ),
          ),
          leadingWidth: 150,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Wrap(
                children: [],
              ),
              Container()
            ],
          ),
        ));
  }
}
