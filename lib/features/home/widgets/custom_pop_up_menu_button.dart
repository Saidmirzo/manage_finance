import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/home/widgets/custom_check_box.dart';

class CustomPopUpMenuButton extends StatelessWidget {
  const CustomPopUpMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: const EdgeInsets.all(5),
      splashRadius: 10,
      surfaceTintColor: AppColors.white,
      onSelected: (value) {},
      onCanceled: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {},
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              CustomChechBox(
                onChange: (value) {},
              ),
              Text('To’langanlar', style: AppTextStyles.body14w4)
            ],
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              CustomChechBox(
                onChange: (value) {},
              ),
              Text('To’lanmaganlar', style: AppTextStyles.body14w4)
            ],
          ),
        ),
        const PopupMenuItem(
          padding: EdgeInsets.all(0),
          child: Divider(
            color: AppColors.grey,
            thickness: 3,
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              CustomChechBox(
                onChange: (value) {},
              ),
              Text('To’langanlar', style: AppTextStyles.body14w4)
            ],
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              CustomChechBox(
                onChange: (value) {},
              ),
              Text('To’langanlar', style: AppTextStyles.body14w4)
            ],
          ),
        ),
      ],
      child: const Icon(Icons.filter_list),
    );
  }
}
