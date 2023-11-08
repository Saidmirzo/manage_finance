import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manage_finance/core/db/db_helper.dart';
import 'package:manage_finance/features/home/models/student_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DBHelper dbHelper;
  HomeBloc(this.dbHelper) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {});

    on<GetAllStudentsEvent>(
      (event, emit) async {
        await dbHelper.init();

        emit(HomeLoadingState());
        final response = await dbHelper.getStudents();
        emit(HomeLoadedState(listStudents: response));
      },
    );
  }
}
