import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/config/enums/bloc_status.dart';
import 'package:manage_finance/features/home/presentation/widgets/custom_text_button.dart';
import 'package:manage_finance/features/main/widgets/custom_textfield.dart';
import 'package:manage_finance/features/teachers/bloc/bloc/teacher_bloc.dart';
import 'package:manage_finance/features/teachers/data/models/teacher_model.dart';
import 'package:manage_finance/features/teachers/precentation/widgets/custom_bottom_sheet_devider.dart';
import 'package:manage_finance/features/teachers/precentation/widgets/search_pupil_item_widget.dart';

class AddPupilForTeacherBottomSheet extends StatefulWidget {
  const AddPupilForTeacherBottomSheet({
    super.key,
    required this.teacherModel,
  });
  final TeacherModel teacherModel;

  @override
  State<AddPupilForTeacherBottomSheet> createState() =>
      _AddPupilForTeacherBottomSheetState();
}

class _AddPupilForTeacherBottomSheetState
    extends State<AddPupilForTeacherBottomSheet> {
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherBloc, TeacherState>(
      builder: (context, state) {
        if (state.statusNewTeachersStudents == BlocStatus.completed) {
          final listStudents = state.listNewStudents ?? [];
          return Container(
            height: MediaQuery.of(context).size.height * .85,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Stack(
              children: [
                Column(
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
                      hintStyle: AppTextStyles.body16w4
                          .copyWith(color: AppColors.white),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 20.h),
                        itemCount: listStudents.length,
                        itemBuilder: (context, index) => SearchPupilItemWidget(
                          onTap: () {
                            setState(() {
                              if (selectedItems
                                  .contains(listStudents[index].id)) {
                                selectedItems.remove(listStudents[index].id);
                              } else {
                                selectedItems.add(listStudents[index].id!);
                              }
                            });
                          },
                          isSelected:
                              selectedItems.contains(listStudents[index].id),
                          newStudentModel: listStudents[index],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 180.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: AppColors.gradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: CustomTextButton(
                      text: "Qo'shish",
                      onTap: () {
                        
                        context.read<TeacherBloc>().add(
                              AddStudentForTeacherEvent(
                                listStudentIds: selectedItems,
                                teacherId: widget.teacherModel.id!,
                              ),
                            );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
