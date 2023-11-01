import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key, this.child, required this.onTap,
  });
  final Widget? child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        height: 48.h,
        width: 48.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              offset: const Offset(0, 4),
              blurRadius: 40,
            )
          ],
        ),
        child:child?? Icon(
          Icons.filter_list,
          color: AppColors.black,
        ),
      ),
    );
  }
}