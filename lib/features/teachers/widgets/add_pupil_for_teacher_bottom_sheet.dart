import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_decorations.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/core/enums/status_search_pupil.dart';
import 'package:manage_finance/features/main/widgets/custom_textfield.dart';
import 'package:manage_finance/features/teachers/widgets/custom_bottom_sheet_devider.dart';
import 'package:manage_finance/features/teachers/widgets/search_pupil_item_widget.dart';

class AddPupilForTeacherBottomSheet extends StatelessWidget {
  const AddPupilForTeacherBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .75,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          const CustomBottomSheetDevider(),
          CustomTextField(
            controller: TextEditingController(),
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            leading: Icon(
              Icons.search,
              color: AppColors.white,
            ),
            hintText: 'Search...',
            hintStyle: AppTextStyles.body16w4.copyWith(color: AppColors.white),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 20.h),
              itemCount: 10,
              itemBuilder: (context, index) => const SearchPupilItemWidget(
                  statusSearchPupil: StatusSearchPupil.newPupil),
            ),
          ),
        ],
      ),
    );
  }
}
