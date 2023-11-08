import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manage_finance/core/db/db_helper.dart';
import 'package:manage_finance/features/teachers/data/models/teacher_model.dart';

part 'teacher_event.dart';
part 'teacher_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final DBHelper dbHelper;
  TeacherBloc(this.dbHelper) : super(TeacherInitial()) {
    on<TeacherEvent>((event, emit) {});
    on<GetAllTeachersEvent>(
      (event, emit) async {
        emit(TeacherLoadingState());
        final result = await dbHelper.getTEachers();
        log(result[0].name.toString());
        emit(TeacherLoadedState(listTeachers: result));
      },
    );
  }
}
