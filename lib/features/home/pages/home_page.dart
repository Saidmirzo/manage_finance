import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/main/widgets/custom_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Text('home Page'),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 100.h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  controller: TextEditingController(),
                  width: 265.w,
                  leading: Icon(
                    Icons.search,
                    color: AppColors.white,
                  ),
                  hintText: 'Search...',
                  hintStyle:
                      AppTextStyles.body16w4.copyWith(color: AppColors.white),
                ),
                Container(
                  height: 48.h,
                  width: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        offset: const Offset(0, 4),
                        blurRadius: 40,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.filter_list,
                    color: AppColors.black,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
