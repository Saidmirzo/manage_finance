import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/main/widgets/custom_textfield.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
  });
  final String title;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.body14w5),
        CustomTextField(
          margin: EdgeInsets.only(top: 7.h, bottom: 27.h),
          controller: controller,
          bgColor: AppColors.white,
          borderColor: AppColors.grey,
          hintText: hintText,
        ),
      ],
    );
  }
}
