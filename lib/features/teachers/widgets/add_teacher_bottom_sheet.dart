import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/features/add_pupil/widgets/custom_input_widget.dart';
import 'package:manage_finance/features/home/widgets/custom_text_button.dart';

class AddTeacherBottomSheet extends StatelessWidget {
  const AddTeacherBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .75,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(
            20.r,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 5.h,
            width: 88.w,
            margin: EdgeInsets.only(top: 12.h, bottom: 28.h),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          CustomInputWidget(
            title: 'O’qituvchi familiyasi',
            hintText: "Ismini kiriting....",
            controller: TextEditingController(),
          ),
          CustomInputWidget(
            title: 'Fan nomi',
            hintText: "Fan nomi...",
            controller: TextEditingController(),
          ),
          CustomInputWidget(
            title: 'Summasi(har bir o’quvchi uchun)',
            hintText: "Summasi(har bir o’quvchi uchun)",
            controller: TextEditingController(),
          ),
          CustomTextButton(
            text: 'Qo’shish',
            onTap: () {},
          )
        ],
      ),
    );
  }
}