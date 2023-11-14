import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/app_text_styles.dart';
import 'package:manage_finance/features/add_pupil/widgets/custom_input_widget.dart';
import 'package:manage_finance/features/home/bloc/bloc/home_bloc.dart';
import 'package:manage_finance/features/home/models/student_model.dart';
import 'package:manage_finance/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:manage_finance/features/home/presentation/widgets/custom_text_button.dart';

class AddPupilPage extends StatelessWidget {
  AddPupilPage({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController surName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          child: Text(
            'O’quvchi qo’shish',
            style: AppTextStyles.body20w5,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w).copyWith(top: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomInputWidget(
                title: 'O’quvchi familiyasi',
                hintText: 'Familiyani kiriting...',
                controller: surName,
              ),
              CustomInputWidget(
                title: 'O’quvchi ismi',
                hintText: 'Ismni kiriting...',
                controller: name,
              ),
              CustomTextButton(
                text: "Saqlash",
                onTap: () {
                  if (name.text.isNotEmpty && surName.text.isNotEmpty) {
                    context.read<HomeBloc>().add(
                          AddNewStudent(
                            studentModel: StudentModel(
                              name: name.text + surName.text,
                              days: 30,
                              payment: 0,
                              paymentDate:
                                  DateTime.now().millisecondsSinceEpoch,
                              dateId: 2,
                              addedDate: DateTime.now().millisecondsSinceEpoch,
                            ),
                          ),
                        );
                    name.clear();
                    surName.clear();
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
