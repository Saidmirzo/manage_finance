import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/config/constants/assets.dart';
import 'package:manage_finance/features/home/widgets/progress_bar.dart';
import 'package:manage_finance/features/home/widgets/student_item_widget.dart';
import 'package:manage_finance/features/main/widgets/custom_back_button.dart';

class TeacherDetailPage extends StatelessWidget {
  const TeacherDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.r),
            bottomRight: Radius.circular(25.r),
          ),
        ),
        title: Text('Oybek Domla', style: AppTextStyles.body20w5),
        leading: CustomBackButton(
          onTap: () {},
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 18.w).copyWith(top: 20.h),
        itemCount: 10,
        itemBuilder: (context, index) =>
            StudentItemWidget(isActive: index == 0),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.black,
            shape: const CircleBorder(),
            child: Icon(Icons.edit, color: AppColors.white),
          ),
          SizedBox(height: 10.h),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.black,
            shape: const CircleBorder(),
            child: SvgPicture.asset(Assets.icons.add),
          ),
        ],
      ),
    );
  }
}
