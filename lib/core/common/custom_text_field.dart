import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../configs/dimension/dimension_manager.dart';
import '../../configs/theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String text;
  final Color? textColor;
  final Color? labelColor;
  final Color? iconColor;
  final Color? fillColor;
  final Color? cursorColor;
  final bool? enableBorder;
  final String hint;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final dynamic validator;
  final int? maxLine;
  final dynamic onChanged;
  final dynamic onSaved;
  final bool isDigitOnly;
  final bool isPassword;
  final bool isEnabled;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  const CustomTextFormField(
      {super.key,
      required this.text,
      this.textColor,
      this.iconColor,
      this.labelColor,
      this.fillColor,
      this.cursorColor = AppColor.primaryColor,
      this.enableBorder = true,
      required this.hint,
      this.prefixIcon,
      required this.controller,
      required this.validator,
      this.maxLine,
      this.onChanged,
      this.onSaved,
      this.isDigitOnly = false,
      this.isPassword = false,
      this.isEnabled = true,
      this.enabledBorderColor,
      this.disabledBorderColor,
      this.focusBorderColor,
      this.errorBorderColor});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      cursorColor: widget.cursorColor,
      obscureText: widget.isPassword ? isObscure : false,
      maxLines: widget.maxLine ?? 1,
      enabled: widget.isEnabled,
      style: TextStyle(color: widget.textColor),
      decoration: widget.enableBorder!
          ? InputDecoration(
              fillColor: widget.fillColor ?? AppColor.swatch,
              filled: widget.fillColor == null ? false : true,
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.symmetric(horizontal: widget.maxLine != null ? DM.width10 : DM.width10, vertical: DM.width10 + DM.width5),
              labelText: widget.text,
              hintText: widget.hint,
              labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: widget.textColor ?? AppColor.swatch),
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColor.grey),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: widget.iconColor ?? AppColor.swatch,
                      size: DM.font18,
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off, color: widget.iconColor ?? AppColor.swatch))
                  : null,
              enabledBorder: widget.enableBorder!
                  ? OutlineInputBorder(
                      borderSide: BorderSide(color: widget.enabledBorderColor ?? AppColor.swatch, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              floatingLabelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: widget.labelColor ?? AppColor.black),
              focusedBorder: widget.enableBorder!
                  ? OutlineInputBorder(
                      borderSide: BorderSide(color: widget.focusBorderColor ?? AppColor.primaryColorLight, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              focusedErrorBorder: widget.enableBorder!
                  ? OutlineInputBorder(
                      borderSide: BorderSide(color: widget.errorBorderColor ?? AppColor.redColor, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              errorBorder: widget.enableBorder!
                  ? OutlineInputBorder(
                      borderSide: BorderSide(color: widget.errorBorderColor ?? AppColor.redColor, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: widget.errorBorderColor ?? AppColor.redColor),
            )
          : InputDecoration(
              filled: true,
              fillColor: widget.fillColor,
              contentPadding: EdgeInsets.symmetric(horizontal: widget.maxLine != null ? DM.width10 : DM.width10, vertical: DM.width10 + DM.width5),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: widget.iconColor ?? AppColor.swatch,
                      size: DM.font18,
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off, color: widget.iconColor ?? AppColor.swatch))
                  : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.grey),
              hintText: widget.hint,
            ),
      keyboardType: widget.isDigitOnly ? TextInputType.number : null,
      inputFormatters: widget.isDigitOnly ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly] : null,
    );
  }
}
