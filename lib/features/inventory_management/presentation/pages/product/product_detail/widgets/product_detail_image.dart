import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/configs/text_style/custom_text_style.dart';
import 'package:project_romance/configs/theme/app_colors.dart';

class ProductDetailImage extends StatelessWidget {
  const ProductDetailImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Product image",
          style: bodyLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          width: 450,
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: 120,
                    height: 120,
                    imageUrl: "",
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/welcome.jpeg",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.cloudArrowUp, color: AppColor.thirdColor),
                    const SizedBox(height: 10),
                    Text(
                      "Drag and drop upload",
                      style: bodyMedium.copyWith(fontWeight: FontWeight.w900),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("or", style: bodySmall.copyWith(color: AppColor.grey, fontWeight: FontWeight.bold)),
                        TextButton(onPressed: () {}, child: Text("Browse", style: bodySmall.copyWith(color: AppColor.thirdColor, fontWeight: FontWeight.bold))),
                        Text("to choose a file", style: bodySmall.copyWith(color: AppColor.grey, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Text("(Up to 5MB)", style: bodySmall),
                  ],
                ))
              ]),
              const SizedBox(height: 15),
              Row(
                children: [
                  ...List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          width: 50,
                          height: 50,
                          imageUrl: "",
                          errorWidget: (context, url, error) => Image.asset(
                            "assets/images/welcome.jpeg",
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(border: Border.all(width: 1, color: AppColor.charcoal), borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text("+2 "),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
