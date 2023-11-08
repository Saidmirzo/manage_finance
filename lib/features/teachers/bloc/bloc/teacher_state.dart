part of 'teacher_bloc.dart';

sealed class TeacherState extends Equatable {
  const TeacherState();

  @override
  List<Object> get props => [];
}

final class TeacherInitial extends TeacherState {}

class TeacherLoadingState extends TeacherState {}

class TeacherLoadedState extends TeacherState {
  final List<TeacherModel> listTeachers;
  const TeacherLoadedState({required this.listTeachers});

  @override
  List<Object> get props => [listTeachers];

}
