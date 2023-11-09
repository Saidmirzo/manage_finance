import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_decorations.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/config/enums/status_search_pupil.dart';
import 'package:manage_finance/features/teachers/data/models/new_teacher_student_model.dart';

class SearchPupilItemWidget extends StatelessWidget {
  const SearchPupilItemWidget({
    super.key,
    required this.onTap,
    required this.newStudentModel,
    required this.isSelected,
  });
  final Function() onTap;
  final NewStudentModel newStudentModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        margin: EdgeInsets.symmetric(vertical: 7.5.h, horizontal: 18.w),
        decoration: BoxDecoration(
          color: getColor(),
          boxShadow: [AppDecorations.defBoxShadow],
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          newStudentModel.name ?? "Unknown",
          style: AppTextStyles.body18w5.copyWith(
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }

  Color getColor() {
    StatusSearchPupil statusSearchPupil;
    if (newStudentModel.inLesson == 1) {
      statusSearchPupil = StatusSearchPupil.inLesson;
    } else if (isSelected) {
      statusSearchPupil = StatusSearchPupil.newPupil;
    } else {
      statusSearchPupil = StatusSearchPupil.def;
    }
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
