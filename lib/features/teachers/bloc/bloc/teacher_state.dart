part of 'teacher_bloc.dart';


@freezed
class TeacherState with _$TeacherState {
  const factory TeacherState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetTeacher,
    @Default(BlocStatus.notInitialized) final BlocStatus statusTeachersStudents,
    final List<TeacherModel>? listTeachers,
    final List<StudentModel>? listStudents,
  }) = _TeacherState;
  const TeacherState._();
}
