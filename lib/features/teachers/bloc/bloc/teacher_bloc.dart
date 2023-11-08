import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manage_finance/config/enums/bloc_status.dart';
import 'package:manage_finance/core/db/db_helper.dart';
import 'package:manage_finance/features/home/models/student_model.dart';
import 'package:manage_finance/features/teachers/data/models/teacher_model.dart';

part 'teacher_event.dart';
part 'teacher_state.dart';
part 'teacher_bloc.freezed.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final DBHelper dbHelper;
  TeacherBloc(this.dbHelper) : super(const TeacherState()) {
    on<TeacherEvent>((event, emit) {});
    on<GetAllTeachersEvent>(
      (event, emit) async {
        emit(state.copyWith(statusGetTeacher: BlocStatus.inProgress));
        final result = await dbHelper.getTEachers();
        log(result[0].name.toString());
        emit(
          state.copyWith(
            statusGetTeacher: BlocStatus.completed,
            listTeachers: result,
          ),
        );
      },
    );
    on<GetTeachersStudents>(
      (event, emit)async {
        emit(state.copyWith(statusTeachersStudents: BlocStatus.inProgress));
        final result =await dbHelper.getTeachersStudents(id: event.id);
        emit(state.copyWith(statusTeachersStudents: BlocStatus.completed, listStudents: result));
      },
    );
  }
}
