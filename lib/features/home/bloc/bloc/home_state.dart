part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetAllStudents,
    @Default(BlocStatus.notInitialized) final BlocStatus statusSaveNewStudents,
    final List<StudentModel>? listStudents,
  }) = _HomeState;
  const HomeState._();
}