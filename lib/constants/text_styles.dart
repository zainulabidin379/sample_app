import 'package:flutter/material.dart';
import 'package:sample_app/constants/fonts.dart';

import 'colors.dart';

class AppTextStyle {
  static const TextStyle kVerySmallBodyText = TextStyle(
      fontSize: 10, color: AppColors.kBlack, fontFamily: AppFonts.regular);
  static const TextStyle kSmallBodyText = TextStyle(
      fontSize: 12, color: AppColors.kBlack, fontFamily: AppFonts.regular);
  static const TextStyle kDefaultBodyText = TextStyle(
      fontSize: 14, color: AppColors.kBlack, fontFamily: AppFonts.regular);
  static const TextStyle kMediumBodyText = TextStyle(
      fontSize: 16, color: AppColors.kBlack, fontFamily: AppFonts.regular);
  static const TextStyle kLargeBodyText = TextStyle(
      fontSize: 18, color: AppColors.kBlack, fontFamily: AppFonts.regular);
  static const TextStyle kVeryLargeBodyText = TextStyle(
      fontSize: 20, color: AppColors.kBlack, fontFamily: AppFonts.regular);
  static const TextStyle kHeadingText = TextStyle(
      fontSize: 22, color: AppColors.kBlack, fontFamily: AppFonts.bold);
}
