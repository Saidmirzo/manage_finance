import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/config/constants/assets.dart';
import 'package:manage_finance/features/home/widgets/student_item_widget.dart';
import 'package:manage_finance/features/main/widgets/custom_back_button.dart';
import 'package:manage_finance/features/teachers/widgets/add_pupil_for_teacher_bottom_sheet.dart';

class TeacherDetailPage extends StatelessWidget {
  TeacherDetailPage({super.key});
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Widget> listItems = [
    const StudentItemWidget(isActive: true),
    const StudentItemWidget(isActive: true),
    const StudentItemWidget(isActive: true),
    const StudentItemWidget(isActive: true),
  ];

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
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
      ),
      body: AnimatedList(
        padding: EdgeInsets.symmetric(horizontal: 18.w).copyWith(top: 20.h),
        key: listKey,
        initialItemCount: listItems.length,
        itemBuilder: (context, index, animation) {
          return slideIt(context, index, animation);
        },
      ),
      // ListView.builder(
      //   padding: EdgeInsets.symmetric(horizontal: 18.w).copyWith(top: 20.h),
      //   itemCount: 10,
      //   itemBuilder: (context, index) =>
      //       StudentItemWidget(isActive: index == 0),
      // ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              listKey.currentState?.removeItem(
                0,
                (_, animation) => FadeOutParticle(
                  disappear: true,
                  child: slideIt(context, 0, animation),
                ),
                duration: const Duration(milliseconds: 500),
              );
              listItems.removeAt(0);
            },
            backgroundColor: AppColors.black,
            shape: const CircleBorder(),
            child: Icon(Icons.edit, color: AppColors.white),
          ),
          SizedBox(height: 10.h),
          FloatingActionButton(
            heroTag: "2",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const AddPupilForTeacherBottomSheet();
                },
              );
            },
            backgroundColor: AppColors.black,
            shape: const CircleBorder(),
            child: SvgPicture.asset(Assets.icons.add),
          ),
        ],
      ),
    );
  }

  Widget slideIt(BuildContext context, int index, animation) {
    Widget item = listItems[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(animation),
      child: item,
    );
  }
}
