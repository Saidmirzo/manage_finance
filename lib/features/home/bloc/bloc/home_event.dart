part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAllStudentsEvent extends HomeEvent {}

class SetPaymentEvent extends HomeEvent {
  final StudentModel studentModel;
  const SetPaymentEvent({required this.studentModel});
}

class AddNewStudent extends HomeEvent {
  final StudentModel studentModel;
  const AddNewStudent({required this.studentModel});
}

class DeleteStudentEvent extends HomeEvent {
  final StudentModel studentModel;
  const DeleteStudentEvent({required this.studentModel});
}

class SearchStudenEvent extends HomeEvent {
  final String text;
  const SearchStudenEvent({required this.text});
}
