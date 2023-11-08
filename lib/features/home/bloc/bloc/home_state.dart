part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<StudentModel> listStudents;
  const HomeLoadedState({required this.listStudents});

  @override
  List<Object> get props => [listStudents];
}
