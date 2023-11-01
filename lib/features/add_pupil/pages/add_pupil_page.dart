import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/add_pupil/widgets/custom_input_widget.dart';
import 'package:manage_finance/features/home/widgets/custom_app_bar.dart';
import 'package:manage_finance/features/home/widgets/custom_text_button.dart';
import 'package:manage_finance/features/main/widgets/custom_textfield.dart';

class AddPupilPage extends StatelessWidget {
  const AddPupilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          child: Text(
            'O’quvchi qo’shish',
            style: AppTextStyles.body20w5,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w).copyWith(top: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputWidget(
                title: 'O’quvchi familiyasi',
                hintText: 'Familiyani kiriting...',
                controller: TextEditingController(),
              ),
              CustomInputWidget(
                title: 'O’quvchi ismi',
                hintText: 'Ismni kiriting...',
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
