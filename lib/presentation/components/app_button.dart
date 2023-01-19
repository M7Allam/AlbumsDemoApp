import 'package:albums_demo_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor, textColor;
  final double height, letterSpacing, fontSize, paddingV, paddingH, borderRadius, elevation;

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.height = 50.0,
    this.letterSpacing = 1.2,
    this.fontSize = 16.0,
    this.paddingV = 14.0,
    this.paddingH = 72.0,
    this.borderRadius = 32.0,
    this.elevation = 2.0,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      padding: EdgeInsets.symmetric(
          vertical: paddingV, horizontal: paddingH
      ),
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
      ),
      onPressed: onPressed,
      elevation: elevation,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
