import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/shared_components/custom_text_field.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';

class ActionTextField extends StatefulWidget {
  final String text;
  final String hint;
  final VoidCallback onDelete;
  const ActionTextField(
      {super.key,
      required this.text,
      required this.hint,
      required this.onDelete});

  @override
  State<ActionTextField> createState() => _ActionTextFieldState();
}

class _ActionTextFieldState extends State<ActionTextField> {
  bool isHoveringOnTextField = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHoveringOnTextField = value;
        });
      },
      child: Row(
        children: [
          const SizedBox(
            width: 50,
            child: Center(
              child: FaIcon(FontAwesomeIcons.envelope,
                  color: AppColor.primaryColor),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: CustomTextFormField(
                text: widget.text,
                hint: widget.hint,
                controller: TextEditingController(),
                enabledBorderColor: AppColor.primaryColor,
                validator: null),
          ),
          if (isHoveringOnTextField)
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                    color: AppColor.redColor,
                    onPressed: widget.onDelete,
                    icon: FaIcon(FontAwesomeIcons.trashCan,
                        size: bodyLarge.fontSize))
              ],
            )
        ],
      ),
    );
  }
}
