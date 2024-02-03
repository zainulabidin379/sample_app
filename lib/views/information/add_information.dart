import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sample_app/constants/colors.dart';
import 'package:sample_app/constants/fonts.dart';
import 'package:sample_app/constants/text_styles.dart';
import 'package:sample_app/controllers/information_controller.dart';
import 'package:sample_app/widgets/custom_drop_down_button.dart';
import 'package:sample_app/widgets/custom_elevated_button.dart';
import 'package:sample_app/widgets/custom_text_field.dart';
import 'package:the_validator/the_validator.dart';

class AddInformationScreen extends StatelessWidget {
  const AddInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite.withOpacity(0.96),
      // AppBar
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
            onPressed: () => "Back button Pressed".log(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.kPrimary,
            )),
        centerTitle: false,
        title: Text(
          "Add Information",
          style:
              AppTextStyle.kMediumBodyText.copyWith(fontFamily: AppFonts.bold),
        ),
      ),
      // Body
      body: GetBuilder<InformationController>(
          init: InformationController(),
          builder: (controller) {
            return ListView(
              padding: 15.padAll(),
              children: [
                Text(
                  "Basic Information",
                  style: AppTextStyle.kLargeBodyText
                      .copyWith(fontFamily: AppFonts.bold),
                ),
                const Gap(15),

                // Full Name
                CustomTextField(
                    controller: controller.name.value,
                    hintText: "Your Full Name",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: FieldValidator.required(message: "*Required"),
                    isRequired: true,
                    maxLength: 20,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    label: "Full Name"),

                // Full Name
                CustomTextField(
                    controller: controller.bio.value,
                    hintText: "Something about yourself",
                    keyboardType: TextInputType.text,
                    minLines: 4,
                    maxLength: 100,
                    textInputAction: TextInputAction.next,
                    validator: FieldValidator.required(message: "*Required"),
                    isRequired: true,
                    label: "Full Name"),

                // Gender
                CustomDropDownButton(
                    dropDownName: "Gender",
                    hintText: "Select Gender",
                    selectedOption: "",
                    isRequired: true,
                    options: const ["Male", "Female"]),
                const Gap(15),

                // Date of birth
                CustomDropDownButton(
                    dropDownName: "Date of Birth",
                    hintText: "Select DOB",
                    selectedOption: "",
                    isRequired: true,
                    options: const []),
                const Gap(15),

                // Lives
                CustomDropDownButton(
                    dropDownName: "Lives",
                    hintText: "Select City",
                    selectedOption: "",
                    isRequired: true,
                    options: const [
                      "Islamabad",
                      "Rawalpindi",
                      "Lahore",
                      "Peshawar",
                      "Karachi",
                    ]),

                Gap(context.h(4)),

                // Update Button
                CustomElevatedButton(title: "Update", onPress: () {})
              ],
            );
          }),
    ).unFocus(context);
  }
}
