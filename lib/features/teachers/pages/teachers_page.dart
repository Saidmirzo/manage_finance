import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_finance/config/constants/all_constants.dart';
import 'package:manage_finance/features/home/widgets/custom_app_bar.dart';
import 'package:manage_finance/features/teachers/bloc/bloc/teacher_bloc.dart';
import 'package:manage_finance/features/teachers/widgets/teacher_item_widget.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  @override
  void initState() {
    super.initState();
    context.read<TeacherBloc>().add(GetAllTeachersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          child: Text(
            'O’qituvchilar',
            style: AppTextStyles.body20w5,
          ),
        ),
        BlocBuilder<TeacherBloc, TeacherState>(
          builder: (context, state) {
            if (state is TeacherLoadedState) {
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 18.h)
                      .copyWith(top: 30.h),
                  itemCount: state.listTeachers.length,
                  itemBuilder: (context, index) {
                    return TeacherItemWidget(
                        teacherModel: state.listTeachers[index]);
                  },
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
