import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_decorations.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/settings/models/date_model.dart';

class DateItem extends StatelessWidget {
  const DateItem({
    super.key,
    required this.isActive,
    required this.dateModel,
    required this.onTap,
  });
  final bool isActive;
  final DateModel dateModel;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(vertical: 7.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: isActive ? Border.all(color: AppColors.green) : null,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [AppDecorations.defBoxShadow],
        ),
        child: Text(
          DateFormat("MMMM")
              .format(DateTime.fromMillisecondsSinceEpoch(dateModel.date!)),
          style: AppTextStyles.body24w4,
        ),
      ),
    );
  }
}
