import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_decorations.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/core/extantions/number_extantion.dart';
import 'package:manage_finance/features/home/presentation/widgets/delete_dialog_widget.dart';
import 'package:manage_finance/features/teachers/bloc/bloc/teacher_bloc.dart';
import 'package:manage_finance/features/teachers/data/models/teacher_model.dart';
import 'package:manage_finance/features/teachers/precentation/pages/teacher_detail.dart';

class TeacherItemWidget extends StatelessWidget {
  const TeacherItemWidget({
    super.key,
    required this.teacherModel,
  });
  final TeacherModel teacherModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<TeacherBloc>()
            .add(GetTeachersStudents(id: teacherModel.id ?? 1));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherDetailPage(teacherModel: teacherModel),
          ),
        );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => DeleteDialogWidget(
            onDelete: () {
              context.read<TeacherBloc>().add(
                    DeleteTeacherEvent(teacherModel: teacherModel),
                  );
            },
            name: teacherModel.name,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        margin: EdgeInsets.symmetric(vertical: 7.5.h),
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
                  teacherModel.name ?? "Unknown",
                  style: AppTextStyles.body18w5.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  teacherModel.subjectName ?? "",
                  style: AppTextStyles.body18w5.copyWith(
                    color: AppColors.textColor,
                  ),
                )
              ],
            ),
            Text(
              teacherModel.payment != null
                  ? teacherModel.payment!.floor().format()
                  : 0.format(),
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
