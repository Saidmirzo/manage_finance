import 'package:get_it/get_it.dart';
import 'package:manage_finance/core/db/db_helper.dart';
import 'package:manage_finance/features/home/bloc/bloc/home_bloc.dart';
import 'package:manage_finance/features/settings/bloc/bloc/settings_bloc.dart';
import 'package:manage_finance/features/teachers/bloc/bloc/teacher_bloc.dart';

final GetIt sl = GetIt.instance;
Future<void> init() async {
  //!Bloc
  sl.registerFactory(() => HomeBloc(sl()));
  sl.registerFactory(() => TeacherBloc(sl()));
  sl.registerFactory(() => SettingsBloc(sl()));

  //---Event
  // sl.registerLazySingleton(() => GetAllCategoriesEvent());

  //--Repository
  // sl.registerLazySingleton<HomeRepository>(
  //     () => HomeRepositoryImpl(homeRemotedataSource: sl(), networkInfo: sl()));

  //--dataSource

  //! Core
  // sl.registerLazySingleton<NetworkInfo>(
  //     () => NetworkInfoImpl(interConnection: sl()));

  //!Extarnal
  // sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<DBHelper>(() => DBHelper());
}
