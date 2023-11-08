import 'package:get_it/get_it.dart';
import 'package:manage_finance/core/db/db_helper.dart';

final GetIt sl = GetIt.instance;
Future<void> init() async {
  //!Bloc
  // sl.registerFactory(() => HomeBloc(homeRepository: sl()));

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
