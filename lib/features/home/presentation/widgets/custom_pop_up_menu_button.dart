
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/enums/sort_status.dart';
import 'package:manage_finance/features/home/bloc/bloc/home_bloc.dart';
import 'package:manage_finance/features/home/presentation/widgets/custom_check_box.dart';

class CustomPopUpMenuButton extends StatefulWidget {
  const CustomPopUpMenuButton({
    super.key,
  });

  @override
  State<CustomPopUpMenuButton> createState() => _CustomPopUpMenuButtonState();
}

class _CustomPopUpMenuButtonState extends State<CustomPopUpMenuButton> {
  SortStatus? sortStatus = SortStatus.name;

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
          padding: const EdgeInsets.all(0),
          enabled: false,
          child: CustomChechBox(
            onChange: (value) {
              context
                  .read<HomeBloc>()
                  .add(GetAllStudentsEvent(sortStatus: value));
            },
          ),
        ),
      ],
      child: const Icon(Icons.filter_list),
    );
  }
}
