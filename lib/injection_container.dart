import 'package:get_it/get_it.dart';
import 'package:grocessary/feature/groceries/data/repository/grocery_repository_impl.dart';
import 'package:grocessary/feature/groceries/presentation/bloc/grocery_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'feature/groceries/data/datasource/grocery_remote_datasource.dart';
import 'feature/groceries/domain/repository/grocery_repository.dart';
import 'feature/groceries/domain/usecases/get_grocery_by_id.dart';
import 'feature/groceries/domain/usecases/get_groceries.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  // Features - Grocery

  // Bloc
  sl.registerFactory(
    () => GroceryBloc(
      getGroceries: sl(),
      getGroceryById: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetGroceries(sl()));
  sl.registerLazySingleton(() => GetGroceryById(sl()));

  // Repository
  sl.registerLazySingleton<GroceryRepository>(() => GroceryRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  // Data sources
  sl.registerLazySingleton<GroceryRemoteDataSource>(
    () => GroceryRemoteDataSource(client: sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
