import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.height = 60,
    this.width,
    this.fontSize = 18,
    this.buttonColor = AppColors.kPrimary,
    this.textColor = AppColors.kWhite,
    required this.title,
    required this.onPress,
    this.borderSide = BorderSide.none,
    this.fontFamily = AppFonts.bold,
    this.borderRadius = 12,
  });
  final String? title;
  final double? height, width, fontSize;
  final Color? textColor, buttonColor;
  final void Function()? onPress;
  final BorderSide borderSide;
  final String? fontFamily;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: 8,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderSide,
          ),
        ),
        onPressed: onPress,
        child: Text(
          title!,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}
