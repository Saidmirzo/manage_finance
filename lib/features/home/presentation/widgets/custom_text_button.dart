import 'package:flutter/material.dart';
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
    this.bgColor,
    this.size, this.textStyle,
  });
  final String text;
  final Function() onTap;
  final double? height;
  final EdgeInsets? padding;
  final Color? bgColor;
  final Size? size;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: AppDecorations.buttonStyle(
          borderRadius: 12,
          size: size ??
              (height != null
                  ? Size(height!, double.maxFinite)
                  : const Size.fromWidth(double.maxFinite)),
          bgColor: bgColor ?? AppColors.primaryColor,
          padding: padding),
      child: Text(
        text,
        style:textStyle?? AppTextStyles.body24w5.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
