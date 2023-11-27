import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manage_finance/config/enums/bloc_status.dart';
import 'package:manage_finance/core/db/db_helper.dart';
import 'package:manage_finance/features/home/models/student_model.dart';
import 'package:manage_finance/features/teachers/data/models/new_teacher_model.dart';
import 'package:manage_finance/features/teachers/data/models/new_teacher_student_model.dart';
import 'package:manage_finance/features/teachers/data/models/teacher_model.dart';

part 'teacher_event.dart';
part 'teacher_state.dart';
part 'teacher_bloc.freezed.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final DBHelper dbHelper;
  List<NewStudentModel> listNewStudents = [];
  TeacherBloc(this.dbHelper) : super(const TeacherState()) {
    on<TeacherEvent>((event, emit) {});
    on<GetAllTeachersEvent>(
      (event, emit) async {
        emit(state.copyWith(statusGetTeacher: BlocStatus.inProgress));
        final result = await dbHelper.getTEachers();
        emit(
          state.copyWith(
            statusGetTeacher: BlocStatus.completed,
            listTeachers: result,
          ),
        );
      },
    );
    on<GetTeachersStudents>(
      (event, emit) async {
        emit(state.copyWith(statusTeachersStudents: BlocStatus.inProgress));
        final result = await dbHelper.getTeachersStudents(id: event.id);
        emit(state.copyWith(
            statusTeachersStudents: BlocStatus.completed,
            listStudents: result));
      },
    );
    on<GetNewTeachersStudents>(
      (event, emit) async {
        emit(state.copyWith(statusNewTeachersStudents: BlocStatus.inProgress));
        final result = await dbHelper.getNewTeachersStudents(id: event.id);
        listNewStudents = result;
        emit(
          state.copyWith(
            statusNewTeachersStudents: BlocStatus.completed,
            listNewStudents: result,
          ),
        );
      },
    );
    on<SearchNewStudentsEvent>((event, emit) {
      emit(state.copyWith(statusNewTeachersStudents: BlocStatus.inProgress));
      List<NewStudentModel> result = [];
      for (var element in listNewStudents) {
        if (element.name!.toLowerCase().contains(event.text.toLowerCase())) {
          result.add(element);
        }
      }
      emit(
        state.copyWith(
          statusNewTeachersStudents: BlocStatus.completed,
          listNewStudents: result,
        ),
      );
    });
    on<AddStudentForTeacherEvent>(
      (event, emit) async {
        for (var element in event.listStudentIds) {
          await dbHelper.addStudentForTeachers(
              teacherId: event.teacherId, studentId: element);
        }
        add(GetTeachersStudents(id: event.teacherId));
        add(GetAllTeachersEvent());
      },
    );
    on<DeleteStudentFromTeacherEvent>((event, emit) async {
      await dbHelper.deleteStudentFromTeacher(event.studentModel);
      add(GetTeachersStudents(id: event.teacherModel.id!));
      add(GetAllTeachersEvent());
    });
    on<AddNewTeacherEvent>(
      (event, emit) async {
        await dbHelper.addNewTeacher(teacherModel: event.teacherModel);
        add(GetAllTeachersEvent());
      },
    );
    on<DeleteTeacherEvent>(
      (event, emit) async {
        await dbHelper.deleteTeacher(teacherModel: event.teacherModel);
        add(GetAllTeachersEvent());
      },
    );
  }
}
