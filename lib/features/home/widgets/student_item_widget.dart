import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';

class StudentItemWidget extends StatelessWidget {
  const StudentItemWidget({
    super.key,
    required this.isActive,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5.h),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: isActive ? AppColors.actievColor : AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 40,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saidmirza Baxromov',
                style: AppTextStyles.body18w5.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              Text(
                '12.10.2023  Okt',
                style: AppTextStyles.body12w5.copyWith(color: AppColors.grey),
              )
            ],
          ),
          Text('700 000 so’m', style: AppTextStyles.body12w5)
        ],
      ),
    );
  }
}
