import 'package:flutter/material.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';

class SupportDescriptionWidget extends StatelessWidget {
  const SupportDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 450,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: headlineSmall.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet risus odio, efficitur maximus nisi scelerisque et. Integer elementum dictum tellus, eget fermentum velit. Etiam mattis est sit amet enim rhoncus posuere. Phasellus dapibus tincidunt nisi a porttitor. Vivamus tempus finibus neque, sed cursus leo condimentum at. Fusce at mauris quis eros venenatis venenatis. Ut gravida sed erat sed vestibulum. Cras id diam id nibh facilisis mollis. Nulla vitae consectetur neque, quis fermentum nunc. Praesent vel sapien diam. Fusce aliquet lacus sed tortor volutpat, ac pharetra nisl tincidunt. In condimentum at nunc vel condimentum. Sed diam est, iaculis eu pretium at, imperdiet et purus. Nullam quis laoreet nunc, et fringilla libero. Donec et ultrices ex, in suscipit orci. Praesent at elit quis mi vehicula ornare. Duis vel elit in arcu malesuada lobortis. Cras vitae odio scelerisque, mattis leo et, efficitur leo. Mauris et purus tincidunt, facilisis purus et, bibendum orci. Nulla nec ullamcorper sapien, sodales porttitor lorem. Phasellus a ipsum mauris. Vestibulum tincidunt pretium dolor, sit amet viverra turpis scelerisque egestas. Sed efficitur velit odio, eu blandit elit ornare non. Duis gravida quam vel dolor efficitur, quis bibendum augue imperdiet. Donec sed risus a velit aliquet tempor vitae sit amet elit. Aliquam ultrices enim vitae fermentum dapibus. Aliquam eros ex, semper ut sem vel, scelerisque fermentum neque. Vivamus placerat eros sit amet sapien feugiat, eu mollis ex gravida. Phasellus turpis augue, euismod ac leo a, vestibulum tincidunt erat. Suspendisse molestie diam ut lacinia congue. Etiam nec arcu in turpis hendrerit laoreet. Vestibulum aliquet at felis quis lacinia.",
              style: bodyMedium),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
