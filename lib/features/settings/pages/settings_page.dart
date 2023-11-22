import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/add_pupil/widgets/custom_input_widget.dart';
import 'package:manage_finance/features/home/bloc/bloc/home_bloc.dart';
import 'package:manage_finance/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:manage_finance/features/home/presentation/widgets/custom_text_button.dart';
import 'package:manage_finance/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:manage_finance/features/settings/models/date_model.dart';
import 'package:manage_finance/features/settings/pages/widgets/date_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int activeIndex = 0;
  final TextEditingController flatAndFoodPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          child: Text(
            'Settings',
            style: AppTextStyles.body20w5,
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 18.w),
        //   child: Column(
        //     children: [
        //       CustomInputWidget(
        //         title: 'Yotoxona va oziq-ovqat summasi:',
        //         hintText: 'Summani kiriting...',
        //         controller: flatAndFoodPrice,
        //         textInputType: TextInputType.number,
        //       ),
        //       CustomTextButton(
        //         text: 'Saqlash',
        //         onTap: () {},
        //       ),
        //     ],
        //   ),
        // ),
        Expanded(
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state is SettingsLoadedState) {
                List<DateModel> list =
                    context.read<SettingsBloc>().listDates ?? [];
                list = list.reversed.toList();
                return ListView.builder(
                  itemCount: list.length,
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  itemBuilder: (context, index) {
                    return DateItem(
                      isActive:
                          context.read<SettingsBloc>().dateModel == list[index],
                      onTap: () {
                        context
                            .read<SettingsBloc>()
                            .add(SetMonthEvent(dateModel: list[index]));
                        context.read<HomeBloc>().add(GetAllStudentsEvent());
                      },
                      dateModel: list[index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
          child: CustomTextButton(
            textStyle: AppTextStyles.body18w5.copyWith(
              color: AppColors.white,
            ),
            text: "Yangi oy uchun baza yaratish",
            onTap: () {
              DateTime now = DateTime.now();
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      height: 170.h,
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${DateFormat("MMMM").format(now)} \n shu oyni yaratmoqchimisiz?',
                            style: AppTextStyles.body20w5,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextButton(
                                text: "Bekor qilish",
                                size: Size.fromHeight(45.h),
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                textStyle: AppTextStyles.body16w5
                                    .copyWith(color: AppColors.white),
                                onTap: () => Navigator.pop(context),
                              ),
                              SizedBox(width: 10.w),
                              CustomTextButton(
                                text: "Yaratish",
                                size: Size.fromHeight(45.h),
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                bgColor: AppColors.red,
                                textStyle: AppTextStyles.body16w5
                                    .copyWith(color: AppColors.white),
                                onTap: () {
                                  context.read<SettingsBloc>().add(
                                        CreateNewMonthEvent(
                                          dateModel: DateModel(
                                            date: DateTime.now()
                                                .millisecondsSinceEpoch,
                                          ),
                                        ),
                                      );
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
