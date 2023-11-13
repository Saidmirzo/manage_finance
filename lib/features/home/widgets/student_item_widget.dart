import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/core/extantions/number_extantion.dart';
import 'package:manage_finance/features/home/models/student_model.dart';
import 'package:manage_finance/features/home/widgets/custom_payment_dialog.dart';
import 'package:manage_finance/features/home/widgets/delete_dialog_widget.dart';

class StudentItemWidget extends StatelessWidget {
  const StudentItemWidget({
    super.key,
    required this.studentModel,
  });
  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    final bool isActive = studentModel.payment == 1000000;
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
      child: InkWell(
        onTap: () {
          showDialog(
            barrierColor: Colors.transparent,
            context: context,
            builder: (context) {
              return CustomPaymentDialog(studentModel: studentModel);
            },
          );
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return DeleteDialogWidget(studentModel: studentModel);
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                studentModel.name ?? 'Unknown',
                style: AppTextStyles.body18w5.copyWith(
                  color: AppColors.textColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat("dd.MM.yy MMM")
                      .format(
                        DateTime.fromMillisecondsSinceEpoch(
                          studentModel.paymentDate ?? 0,
                        ),
                      )
                      .toString(),
                  style: AppTextStyles.body12w5.copyWith(color: AppColors.grey),
                ),
                Text(studentModel.payment!.format(),
                    style: AppTextStyles.body12w5)
              ],
            )
          ],
        ),
      ),
    );
  }
}
