import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 60,
            animation: true,
            percent: .6,
            progressColor: AppColors.progressColor,
            lineWidth: 15,
            backgroundColor: AppColors.white,
            animationDuration: 1000,
            center: Text(
              '80%',
              style: AppTextStyles.body22w7,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'O’quvchilar soni: 70',
                style: AppTextStyles.body18w5,
              ),
              Text(
                'Jami summa: 100 000 000 so’m',
                style: AppTextStyles.body12w5,
              )
            ],
          )
        ],
      ),
    );
  }
}
