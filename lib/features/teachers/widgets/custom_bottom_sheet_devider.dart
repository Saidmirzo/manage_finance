import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';

class CustomBottomSheetDevider extends StatelessWidget {
  const CustomBottomSheetDevider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 88.w,
      margin: EdgeInsets.only(top: 12.h, bottom: 28.h),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(30.r),
      ),
    );
  }
}