import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/home/presentation/widgets/custom_text_button.dart';

class DeleteDialogWidget extends StatelessWidget {
  const DeleteDialogWidget({
    super.key,
    required this.onDelete,
    required this.name,
  });

  final Function onDelete;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 160.h,
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${name ?? "Unknown"}ni",
              style: AppTextStyles.body18w4,
            ),
            Text(
              "Haqiqatdan o'chirmoqchimisiz\nIshonchingiz komilmi?",
              style: AppTextStyles.body14w5,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                  text: "Bekor qilish",
                  size: Size.fromHeight(45.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  textStyle:
                      AppTextStyles.body16w5.copyWith(color: AppColors.white),
                  onTap: () => Navigator.pop(context),
                ),
                SizedBox(width: 10.w),
                CustomTextButton(
                  text: "O’chirish",
                  size: Size.fromHeight(45.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  bgColor: AppColors.red,
                  textStyle:
                      AppTextStyles.body16w5.copyWith(color: AppColors.white),
                  onTap: () {
                    onDelete();

                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
