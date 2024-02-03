import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/constants/fonts.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.validator,
    this.minLines,
    this.readOnly,
    this.onChanged,
    this.inputFormatters,
    required this.label,
    this.isRequired,
    this.maxLength,
  });
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? isRequired;
  final int? minLines;
  final int? maxLength;
  final String hintText;
  final String label;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
            text: label,
            style: AppTextStyle.kMediumBodyText
                .copyWith(fontFamily: AppFonts.medium),
            children: [
              TextSpan(
                text: (isRequired ?? false) ? " *" : '',
                style: AppTextStyle.kDefaultBodyText.copyWith(
                    fontFamily: AppFonts.semibold, color: AppColors.kRed),
              )
            ])),
        const Gap(3),
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          readOnly: readOnly ?? false,
          controller: controller,
          onChanged: onChanged,
          minLines: minLines,
          maxLines: null,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          cursorColor: AppColors.kPrimary,
          style: AppTextStyle.kMediumBodyText,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            filled: true,
            fillColor: AppColors.kWhite,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            hintText: hintText,
            hintStyle: AppTextStyle.kDefaultBodyText
                .copyWith(color: AppColors.kBlack.withOpacity(.3)),
            errorStyle: const TextStyle(color: AppColors.kRed),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                borderSide:
                    const BorderSide(color: AppColors.kPrimary, width: 1.5)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: AppColors.kRed, width: 1.5)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: AppColors.kPrimary, width: 1.5)),
          ),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
        ),
      ],
    );
  }
}
