part of 'teacher_bloc.dart';

sealed class TeacherEvent extends Equatable {
  const TeacherEvent();

  @override
  List<Object> get props => [];
}

class GetAllTeachersEvent extends TeacherEvent {}

class GetTeachersStudents extends TeacherEvent {
  final int id;
  const GetTeachersStudents({required this.id});
}

class GetNewTeachersStudents extends TeacherEvent {
  final int id;
  const GetNewTeachersStudents({required this.id});
}

class AddStudentForTeacherEvent extends TeacherEvent {
  final int teacherId;
  final List<int> listStudentIds;
  const AddStudentForTeacherEvent({required this.listStudentIds, required this.teacherId});
}
