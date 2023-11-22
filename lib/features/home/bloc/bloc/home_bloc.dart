import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_finance/config/enums/bloc_status.dart';
import 'package:manage_finance/core/db/db_helper.dart';
import 'package:manage_finance/features/home/models/student_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DBHelper dbHelper;
  List<StudentModel> listStudents = [];
  HomeBloc(this.dbHelper) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {});

    on<GetAllStudentsEvent>(
      (event, emit) async {
        emit(state.copyWith(statusGetAllStudents: BlocStatus.inProgress));
        final response = await dbHelper.getStudents();
        listStudents = response;
        emit(
          state.copyWith(
            statusGetAllStudents: BlocStatus.completed,
            listStudents: response,
          ),
        );
      },
    );
    on<SetPaymentEvent>(
      (event, emit) async {
        await dbHelper.setPayment(event.studentModel);
        add(GetAllStudentsEvent());
      },
    );
    on<AddNewStudent>(
      (event, emit) async {
        emit(state.copyWith(statusSaveNewStudents: BlocStatus.inProgress));
        await dbHelper.addNewStudent(event.studentModel);
        add(GetAllStudentsEvent());
        emit(state.copyWith(statusSaveNewStudents: BlocStatus.completed));
      },
    );
    on<DeleteStudentEvent>(
      (event, emit) async {
        await dbHelper.deleteStudent(event.studentModel);
        add(GetAllStudentsEvent());
      },
    );
    on<SearchStudenEvent>((event, emit) {
      emit(state.copyWith(statusGetAllStudents: BlocStatus.inProgress));
      List<StudentModel> list = [];
      for (var element in listStudents) {
        if (element.name!.toLowerCase().contains(event.text.toLowerCase())) {
          list.add(element);
        }
      }
      emit(
        state.copyWith(
          statusGetAllStudents: BlocStatus.completed,
          listStudents: list,
        ),
      );
    });
  }
}
