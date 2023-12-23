import 'package:flutter/material.dart';
import 'package:project_romance/configs/theme/app_colors.dart';

import '../../../../../../core/shared_components/text_style/custom_text_style.dart';

class LogoWidget extends StatelessWidget {
  final Function(bool) onClick;
  final bool isShown;
  const LogoWidget({super.key, required this.isShown, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () => onClick(!isShown),
            icon: const Icon(Icons.menu, color: AppColor.white)),
        Center(
          child: (isShown)
              ? FutureBuilder(
                  future: _buildUI(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!;
                    } else {
                      return const SizedBox(height: 50);
                    }
                  },
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Future<Widget> _buildUI(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 200));

    return SizedBox(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Project Romance",
            // ignore: use_build_context_synchronously
            style: headlineSmall.copyWith(
              fontFamily: "logofont",
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
