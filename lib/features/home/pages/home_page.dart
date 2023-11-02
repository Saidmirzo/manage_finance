import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/home/widgets/custom_app_bar.dart';
import 'package:manage_finance/features/home/widgets/custom_pop_up_menu_button.dart';
import 'package:manage_finance/features/home/widgets/progress_bar.dart';
import 'package:manage_finance/features/home/widgets/student_item_widget.dart';
import 'package:manage_finance/features/main/widgets/custom_back_button.dart';
import 'package:manage_finance/features/main/widgets/custom_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
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
              CustomBackButton(
                onTap: () {},
                child: const CustomPopUpMenuButton(),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            children: [
              const ProgressBar(),
              ...List.generate(
                10,
                (index) => StudentItemWidget(isActive: index == 0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
