// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/common/custom_text_field.dart';

import '../../../../../../configs/text_style/custom_text_style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  final scrollController = ScrollController();
  bool isDigitalProduct = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Create Product",
                style: headlineLarge.copyWith(color: AppColor.warmWhite),
              ),
              const SizedBox(height: 20),
              Container(
                constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
                child: CustomTextFormField(
                  text: "Name",
                  enableBorder: false,
                  fillColor: const Color(0xFF121212),
                  textColor: AppColor.white,
                  iconColor: AppColor.white,
                  labelColor: AppColor.white,
                  cursorColor: AppColor.mildGreen,
                  hint: "Name (eg. Product1)",
                  enabledBorderColor: AppColor.white,
                  controller: TextEditingController(),
                  validator: null,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
                child: Row(
                  children: [
                    Flexible(
                      child: CustomTextFormField(
                        text: "Price",
                        enableBorder: false,
                        fillColor: const Color(0xFF121212),
                        textColor: AppColor.white,
                        iconColor: AppColor.white,
                        labelColor: AppColor.white,
                        cursorColor: AppColor.mildGreen,
                        hint: "Price (eg.10000)",
                        enabledBorderColor: AppColor.white,
                        controller: TextEditingController(),
                        validator: null,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Digital Product?",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.warmWhite),
                        ),
                        const SizedBox(width: 10),
                        Checkbox(
                            value: isDigitalProduct,
                            checkColor: AppColor.white,
                            onChanged: (newValue) {
                              setState(() {
                                isDigitalProduct = newValue ?? false;
                              });
                            })
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
                child: CustomTextFormField(
                  text: "Product Description",
                  enableBorder: false,
                  fillColor: const Color(0xFF121212),
                  textColor: AppColor.white,
                  iconColor: AppColor.white,
                  labelColor: AppColor.white,
                  cursorColor: AppColor.mildGreen,
                  hint: "Talk about the product",
                  maxLine: 6,
                  enabledBorderColor: AppColor.white,
                  controller: TextEditingController(),
                  validator: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
