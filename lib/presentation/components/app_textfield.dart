import 'package:albums_demo_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final double fontSize, suffixIconSize, borderRadius;
  final bool obscureText;
  final Color textColor;
  final TextInputAction textInputAction;
  final VoidCallback? onSuffixIconPressed;
  final ValueChanged<String>? onChanged;
  final InputBorder? border;

  const AppTextFormField({
    Key? key,
    required this.controller,
    this.validator,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.keyboardType = TextInputType.text,
    this.fontSize = 14.0,
    this.suffixIconSize = 20.0,
    this.borderRadius = 20.0,
    this.obscureText = false,
    this.textColor = AppColors.black,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    if (border != null) {
      decoration = decoration.copyWith(
        border: border,
      );
    }

    if (prefixIcon != null) {
      decoration = decoration.copyWith(
        prefixIcon: Icon(prefixIcon),
      );
    }

    if (suffixIcon != null) {
      decoration = decoration.copyWith(
        suffixIcon: InkWell(
          onTap: onSuffixIconPressed,
          child: Icon(
            suffixIcon,
            size: suffixIconSize,
          ),
        ),
      );
    }

    return TextFormField(
      controller: controller,
      decoration: decoration,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        overflow: TextOverflow.ellipsis,
      ),
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    );
  }
}
