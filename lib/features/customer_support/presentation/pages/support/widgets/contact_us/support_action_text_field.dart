// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/shared_components/custom_text_field.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';

class ActionTextField extends StatefulWidget {
  bool? isDisable;
  final IconData icon;
  final String text;
  final String hint;
  final String value;
  final VoidCallback onDelete;
  final VoidCallback onPressed;

  Function(String)? onChanged;
  ActionTextField(
      {super.key,
      this.isDisable = false,
      required this.icon,
      required this.text,
      required this.hint,
      required this.value,
      required this.onDelete,
      required this.onPressed,
      this.onChanged});

  @override
  State<ActionTextField> createState() => _ActionTextFieldState();
}

class _ActionTextFieldState extends State<ActionTextField> {
  bool isHoveringOnTextField = false;
  final textController = TextEditingController(text: "");

  @override
  void initState() {
    textController.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (value) {
        setState(() {
          isHoveringOnTextField = value;
        });
      },
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Center(
              child: FaIcon(widget.icon, color: AppColor.primaryColor),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: CustomTextFormField(
                isEnabled: !(widget.isDisable ?? false),
                text: widget.text,
                hint: widget.hint,
                controller: textController,
                enabledBorderColor: AppColor.primaryColor,
                onChanged: widget.onChanged,
                validator: null),
          ),
          if (isHoveringOnTextField)
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                    color: AppColor.redColor,
                    onPressed: widget.onDelete,
                    icon: FaIcon(FontAwesomeIcons.circleMinus,
                        size: bodyLarge.fontSize)),
              ],
            )
        ],
      ),
    );
  }
}
