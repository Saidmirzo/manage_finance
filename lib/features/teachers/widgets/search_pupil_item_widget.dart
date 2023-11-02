import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_decorations.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/core/enums/status_search_pupil.dart';

class SearchPupilItemWidget extends StatelessWidget {
  const SearchPupilItemWidget({
    super.key,
    required this.statusSearchPupil,
  });
  final StatusSearchPupil statusSearchPupil;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      margin: EdgeInsets.symmetric(vertical: 7.5.h, horizontal: 18.w),
      decoration: BoxDecoration(
        color: getColor(),
        boxShadow: [AppDecorations.defBoxShadow],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        'Saidmirza Baxromov',
        style: AppTextStyles.body18w5.copyWith(
          color: AppColors.textColor,
        ),
      ),
    );
  }

  Color getColor() {
    switch (statusSearchPupil) {
      case StatusSearchPupil.def:
        return AppColors.white;
      case StatusSearchPupil.newPupil:
        return AppColors.selectedCardColor;
      case StatusSearchPupil.inLesson:
        return AppColors.inLessonCardColor;

      default:
        return AppColors.white;
    }
  }
}
