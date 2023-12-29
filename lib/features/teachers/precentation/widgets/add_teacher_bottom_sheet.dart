import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_colors.dart';
import 'package:manage_finance/features/add_pupil/widgets/custom_input_widget.dart';
import 'package:manage_finance/features/home/presentation/widgets/custom_text_button.dart';
import 'package:manage_finance/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:manage_finance/features/teachers/bloc/bloc/teacher_bloc.dart';
import 'package:manage_finance/features/teachers/data/models/new_teacher_model.dart';
import 'package:manage_finance/features/teachers/precentation/widgets/custom_bottom_sheet_devider.dart';

class AddTeacherBottomSheet extends StatefulWidget {
  const AddTeacherBottomSheet({
    super.key,
  });

  @override
  State<AddTeacherBottomSheet> createState() => _AddTeacherBottomSheetState();
}

class _AddTeacherBottomSheetState extends State<AddTeacherBottomSheet> {
  final TextEditingController name = TextEditingController();

  final TextEditingController subject = TextEditingController();

  final TextEditingController fees = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .75,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(
            20.r,
          ),
        ),
      ),
      child: Column(
        children: [
          const CustomBottomSheetDevider(),
          CustomInputWidget(
            title: 'O’qituvchi ismini',
            hintText: "Ismini kiriting....",
            controller: name,
          ),
          CustomInputWidget(
            title: 'Fan nomi',
            hintText: "Fan nomi...",
            controller: subject,
          ),
          CustomInputWidget(
            title: 'Summasi(har bir o’quvchi uchun)',
            hintText: "Summasi(har bir o’quvchi uchun)",
            textInputType: TextInputType.number,
            controller: fees,
          ),
          CustomTextButton(
            text: 'Qo’shish',
            onTap: () {
              if (name.text.isNotEmpty &&
                  fees.text.isNotEmpty &&
                  subject.text.isNotEmpty) {
                context.read<TeacherBloc>().add(
                      AddNewTeacherEvent(
                          teacherModel: NewTeacherModel(
                        fees: int.parse(fees.text),
                        name: name.text,
                        subjectName: subject.text,
                      )),
                    );
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
