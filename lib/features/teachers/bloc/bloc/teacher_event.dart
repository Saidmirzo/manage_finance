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
