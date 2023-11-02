import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_decorations.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/home/widgets/custom_text_button.dart';
import 'package:manage_finance/features/main/widgets/custom_textfield.dart';

class CustomPaymentDialog extends StatelessWidget {
  const CustomPaymentDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 265,
            width: 255,
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 10,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saidmirza Baxromov',
                  style: AppTextStyles.body14w4,
                ),
                CustomTextField(
                  width: 120.w,
                  height: 30.h,
                  controller: TextEditingController(),
                  bgColor: AppColors.white,
                  boxShadow: AppDecorations.defBoxShadow,
                  hintText: '30 kun',
                ),
                CustomTextField(
                  // height: 46.h,
                  controller: TextEditingController(),
                  bgColor: AppColors.white,
                  boxShadow: AppDecorations.defBoxShadow,
                  hintText: 'To’lov summasi',
                ),
                CustomTextButton(
                  text: 'Saqlash',
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
