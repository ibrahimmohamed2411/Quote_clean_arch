import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/app_interceptors.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:quotes/features/random_quote/data/repositories/quote_repository_imp.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:quotes/features/splash/data/repositories/lang_repository_imp.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repository.dart';
import 'package:quotes/features/splash/domain/usecases/change_lang_usecase.dart';
import 'package:quotes/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:quotes/features/splash/presentation/cubit/local_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features
  // Blocs
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory(
      () => LocalCubit(getSavedLangUsecase: sl(), changeLangUsecase: sl()));
  //Usecases
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));
  sl.registerLazySingleton(() => GetSavedLangUsecase(langRepository: sl()));
  sl.registerLazySingleton(() => ChangeLangUsecase(langRepository: sl()));

  //Repositories
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImp(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImp(langLocalDataSource: sl()));
  // Data Sources
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImp(apiConsumer: sl()));
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImp(sharedPreferences: sl()));
  sl.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSourceImp(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(dataConnectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
}
