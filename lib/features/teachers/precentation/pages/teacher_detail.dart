import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/config/constants/assets.dart';
import 'package:manage_finance/config/enums/bloc_status.dart';
import 'package:manage_finance/features/home/presentation/widgets/student_item_widget.dart';
import 'package:manage_finance/features/teachers/bloc/bloc/teacher_bloc.dart';
import 'package:manage_finance/features/teachers/data/models/teacher_model.dart';
import 'package:manage_finance/features/teachers/precentation/widgets/add_pupil_for_teacher_bottom_sheet.dart';

class TeacherDetailPage extends StatelessWidget {
  TeacherDetailPage({super.key, required this.teacherModel});
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final TeacherModel teacherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherBloc, TeacherState>(
      builder: (context, state) {
        if (state.statusTeachersStudents == BlocStatus.completed) {
          List listItems = state.listStudents ?? [];

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
              title: Text(
                teacherModel.name ?? "Unknown",
                style: AppTextStyles.body20w5,
              ),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return StudentItemWidget(
                  studentModel: listItems[index],
                  teacherModel: teacherModel,
                );
              },
            ),
            // AnimatedList(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: 18.w).copyWith(top: 20.h),
            //   key: listKey,
            //   initialItemCount: listItems.length,
            //   itemBuilder: (context, index, animation) {
            //     return slideIt(context, index, animation, listItems);
            //   },
            // ),
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
                    // listKey.currentState?.removeItem(
                    //   0,
                    //   (_, animation) => FadeOutParticle(
                    //     disappear: true,
                    //     child: slideIt(context, 0, animation, listItems),
                    //   ),
                    //   duration: const Duration(milliseconds: 500),
                    // );
                    // listItems.removeAt(0);
                  },
                  backgroundColor: AppColors.black,
                  shape: const CircleBorder(),
                  child: Icon(Icons.edit, color: AppColors.white),
                ),
                SizedBox(height: 10.h),
                FloatingActionButton(
                  heroTag: "2",
                  onPressed: () {
                    context
                        .read<TeacherBloc>()
                        .add(GetNewTeachersStudents(id: teacherModel.id ?? 1));
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return AddPupilForTeacherBottomSheet(
                          teacherModel: teacherModel,
                        );
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget slideIt(BuildContext context, int index, animation, List listItems) {
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
