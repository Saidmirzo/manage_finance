import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_decorations.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.padding,
    this.height,
  });
  final String text;
  final Function() onTap;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: AppDecorations.buttonStyle(
          borderRadius: 12,
          size: height != null || padding != null
              ? const Size.fromWidth(double.maxFinite)
              : null,
          bgColor: AppColors.primaryColor,
          padding: padding),
      child: Text(
        text,
        style: AppTextStyles.body24w5.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
