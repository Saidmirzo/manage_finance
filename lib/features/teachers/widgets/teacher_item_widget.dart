import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_decorations.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/teachers/pages/teacher_detail.dart';

class TeacherItemWidget extends StatelessWidget {
  const TeacherItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TeacherDetailPage(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [AppDecorations.defBoxShadow],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Oybek domla',
                  style: AppTextStyles.body18w5.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  'Ona tili',
                  style: AppTextStyles.body18w5.copyWith(
                    color: AppColors.textColor,
                  ),
                )
              ],
            ),
            Text(
              "5 000 000 so’m",
              style: AppTextStyles.body18w5.copyWith(
                color: AppColors.textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
