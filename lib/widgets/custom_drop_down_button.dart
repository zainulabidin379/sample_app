// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/text_styles.dart';

class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({
    super.key,
    required this.dropDownName,
    required this.selectedOption,
    required this.options,
    this.color,
    this.isRequired, required this.hintText,
  });
  final String dropDownName;
  final String hintText;
  final List<String> options;
  late String selectedOption;
  final Color? color;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
            text: dropDownName,
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
        DropdownButtonFormField2(
          buttonStyleData: ButtonStyleData(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.only(
              left: 4,
              right: 12,
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            selectedMenuItemBuilder: (context, child) {
              return Container(
                  decoration:
                      BoxDecoration(color: AppColors.kBlack.withOpacity(0.1)),
                  child: child);
            },
          ),

          iconStyleData: const IconStyleData(
            //Inactive Color
            icon: Icon(
              Icons.arrow_drop_down,
              color: AppColors.kBlack,
            ),
            //Active Color
            openMenuIcon: Icon(
              Icons.arrow_drop_up,
              color: AppColors.kPrimary,
            ),
          ),
          style: AppTextStyle.kMediumBodyText.copyWith(
            color: AppColors.kPrimary,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: AppColors.kWhite,
            filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                borderSide: const BorderSide(
                  color: AppColors.kPrimary,
                  width: 1.5,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.kRed,
                  width: 1.5,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.kRed,
                  width: 1.5,
                )),
          ),
          isExpanded: true,
          isDense: false,
          hint: selectedOption.isEmpty
              ? Text(
                  hintText,
                  style: AppTextStyle.kMediumBodyText.copyWith(
                    color: AppColors.kBlack.withOpacity(.3),
                  ),
                )
              : Text(
                  selectedOption,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.kMediumBodyText.copyWith(
                    color: AppColors.kPrimary,
                  ),
                ),

          //Drop Down Menu Styling
          dropdownStyleData: DropdownStyleData(
            isOverButton: false,
            maxHeight: context.h(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            offset: const Offset(0, -4),
          ),
          items: options.map((opt) {
            return DropdownMenuItem(
              value: opt,
              child: Text(
                opt,
                style: AppTextStyle.kMediumBodyText.copyWith(
                  color: AppColors.kBlack,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            selectedOption = value!;
          },
          validator: null,
          onSaved: (_) {},
        ),
      ],
    );
  }
}
