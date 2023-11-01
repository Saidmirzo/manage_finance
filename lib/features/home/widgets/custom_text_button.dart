import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_decorations.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: AppDecorations.buttonStyle(
        borderRadius: 12,
        size: Size(double.maxFinite, 45.h),
        bgColor: AppColors.primaryColor,
      ),
      child: Text(
        text,
        style: AppTextStyles.body24w5.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
