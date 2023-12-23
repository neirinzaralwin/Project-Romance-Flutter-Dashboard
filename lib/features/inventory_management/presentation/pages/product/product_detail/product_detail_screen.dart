import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/product/product_detail/widgets/product_detail_app_bar.dart';
import 'widgets/product_detail_category.dart';
import 'widgets/product_detail_image.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Color pickedColor = AppColor.primaryColor;
  Set<Color> swatches = Colors.primaries.map((e) => Color(e.value)).toSet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: EyeDrop(
          child: CustomScrollView(
            controller: ScrollController(),
            slivers: [
              const ProductDetailAppBar(),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _productAvailabilitySwitch(),
                      const Divider(),
                      const SizedBox(height: 20),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const ProductDetailImage(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ProductDetailCategory(),
                              const SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Color",
                                    style: bodyLarge.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                AppColor.black.withOpacity(0.1),
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          )
                                        ]),
                                    width: 450,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: pickedColor),
                                              ),
                                              const SizedBox(width: 8),
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColor.blueGrey),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 50),
                                        TextButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    child: ColorPicker(
                                                      selectedColor:
                                                          pickedColor,
                                                      onColorSelected:
                                                          (value) => setState(
                                                              () =>
                                                                  pickedColor =
                                                                      value),
                                                      config:
                                                          const ColorPickerConfig(
                                                        enableLibrary: true,
                                                        enableEyePicker: false,
                                                      ),
                                                      onClose:
                                                          Navigator.of(context)
                                                              .pop,
                                                      onEyeDropper: () {},
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Text("Pick color",
                                                style: bodyMedium.copyWith(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]))
            ],
          ),
        ));
  }

  Widget _productAvailabilitySwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Show the product ",
            style: bodyMedium.copyWith(fontWeight: FontWeight.bold)),
        Switch.adaptive(
            applyCupertinoTheme: true,
            activeColor: AppColor.greenDark,
            value: true,
            onChanged: (bool newValue) {}),
      ],
    );
  }
}
