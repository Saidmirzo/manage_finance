import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/core/extantions/number_extantion.dart';
import 'package:manage_finance/features/home/models/student_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.listStudents,
  });
  final List<StudentModel> listStudents;

  @override
  Widget build(BuildContext context) {
    int payments = 0;
    int fixedPayment = 0;

    for (var element in listStudents) {
      payments += element.payment ?? 0;
      fixedPayment += element.fixedPayment ?? 500000;
    }
    final double persentage =
        double.parse((payments / fixedPayment).toStringAsFixed(2));

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
            percent: persentage.truncateToDouble(),
            progressColor: AppColors.progressColor,
            lineWidth: 15,
            backgroundColor: AppColors.white,
            animationDuration: 1000,
            center: Text(
              '${persentage * 100}%',
              style: AppTextStyles.body22w7,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'O’quvchilar soni: ${listStudents.length}',
                style: AppTextStyles.body18w5,
              ),
              Text(
                'Jami summa: ${fixedPayment.format()}',
                style: AppTextStyles.body12w5,
              )
            ],
          )
        ],
      ),
    );
  }
}
