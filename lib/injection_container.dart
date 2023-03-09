import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/constants/strings.dart';
import 'core/services/network_service/network_service.dart';
import 'core/services/network_service/network_service_impl.dart';
import 'data/data_sources/local/hive_local_data_source/hive_local_data_source.dart';
import 'data/data_sources/local/hive_local_data_source/hive_local_data_source_impl.dart';
import 'data/data_sources/local/preferences_data_source/preferences_data_source.dart';
import 'data/data_sources/local/preferences_data_source/preferences_data_source_impl.dart';
import 'data/data_sources/local/transaction_types_local_data_source/transaction_types_local_data_source_impl.dart';
import 'data/data_sources/local/transaction_types_local_data_source/transaction_types_local_data_source.dart';
import 'data/data_sources/local/user_local_data_source/user_local_data_source.dart';
import 'data/data_sources/local/user_local_data_source/user_local_data_source_impl.dart';
import 'data/data_sources/remote/auth_remote_data_source/auth_remote_data_source.dart';
import 'data/data_sources/remote/auth_remote_data_source/auth_remote_data_source_impl.dart';
import 'data/data_sources/remote/transaction_types_remote_data_source/transaction_types_remote_data_source_impl.dart';
import 'data/data_sources/remote/transactions_remote_data_source/transactions_remote_data_source.dart';
import 'data/data_sources/remote/transactions_remote_data_source/transactions_remote_data_source_impl.dart';
import 'data/data_sources/remote/user_remote_data_source/user_remote_data_source.dart';
import 'data/data_sources/remote/user_remote_data_source/user_remote_data_source_impl.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/repositories/hive_repository_impl.dart';
import 'data/repositories/preferences_repository_impl.dart';
import 'data/repositories/transaction_types_repository_impl.dart';
import 'data/repositories/transactions_repository_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'data/services/graphql_service/index.dart';
import 'data/services/hive_service/index.dart';
import 'data/services/shared_preferences_service/index.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/hive_repository.dart';
import 'domain/repositories/preferences_repository.dart';
import 'domain/repositories/transaction_types_repository.dart';
import 'domain/repositories/transactions_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/auth_use_cases/register_user.dart';
import 'domain/use_cases/preferences_use_cases/clear_shared_data.dart';
import 'domain/use_cases/preferences_use_cases/get_user_id.dart';
import 'domain/use_cases/transaction_types_use_cases/get_transaction_types.dart';
import 'domain/use_cases/transactions_use_cases/create_transaction.dart';
import 'domain/use_cases/transactions_use_cases/remove_transaction.dart';
import 'domain/use_cases/user_use_cases/get_user.dart';
import 'domain/use_cases/user_use_cases/update_user.dart';
import 'presentation/cubits/add_transaction_cubit.dart';
import 'presentation/cubits/home_page_cubit.dart';
import 'presentation/cubits/intro_page_cubit.dart';
import 'presentation/cubits/personal_info_edit_modal_bottom_sheet_cubit.dart';
import 'presentation/cubits/personal_info_modal_bottom_sheet_cubit.dart';
import 'presentation/cubits/profile_preferences_cubit.dart';
import 'presentation/cubits/transaction_types_selection_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/router_service/index.dart';
import 'data/data_sources/remote/transaction_types_remote_data_source/transaction_types_remote_data_source.dart';
import 'domain/use_cases/hive_use_cases/close_hive_local_database.dart';
import 'domain/use_cases/hive_use_cases/init_hive_local_database.dart';
import 'domain/use_cases/preferences_use_cases/store_user_id.dart';
import 'presentation/cubits/splash_page_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  _setupBlocs();
  _setupServices();
  _setUpDataSources();
  _setUpRepositories();
  _setUpUseCases();
  _setupCores();
  await setupExternals();
}

//* Blocs
void _setupBlocs() {
  getIt.registerFactory(
      () => SplashPageCubit(getUserId: getIt(), navigation: getIt()));
  getIt.registerFactory(() =>
      AddTransactionCubit(navigation: getIt(), createTransation: getIt()));
  getIt.registerFactory(
      () => HomePageCubit(getUser: getIt(), removeTransation: getIt()));
  getIt.registerFactory(() => TransactionTypesSelectionCubit(
      getTransactionTypes: getIt(), navigation: getIt()));
  getIt.registerFactory(() => IntroPageCubit(navigation: getIt()));
  getIt.registerFactory(() => PersonalInfoModalBottomSheetCubit(
      registerUser: getIt(), navigation: getIt()));
  getIt.registerFactory(() => PersonalInfoEditModalBottomSheetCubit(
      updateUser: getIt(), navigation: getIt()));

  getIt.registerFactory(() =>
      ProfilePreferencesCubit(navigation: getIt(), clearSharedData: getIt()));
}

//* Services
void _setupServices() {
  getIt.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesServiceImpl(getIt()));
  getIt.registerLazySingleton<HiveService>(() => HiveServiceImpl());
  getIt
      .registerLazySingleton<GraphqlService>(() => GraphqlServiceImpl(getIt()));
}

//* Data Sources
void _setUpDataSources() {
  getIt.registerLazySingleton<PreferencesDataSource>(
      () => PreferencesDataSourceImpl(getIt()));

  getIt.registerLazySingleton<TransactionTypesLocalDataSource>(
      () => TransactionTypesLocalDataSourceImpl(getIt()));

  getIt.registerLazySingleton<TransactionTypesRemoteDataSource>(
      () => TransactionTypesRemoteDataSourceImpl(getIt()));

  getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(getIt()));

  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(getIt()));

  getIt.registerLazySingleton<TransactionsRemoteDataSource>(
      () => TransactionsRemoteDataSourceImpl(getIt()));

  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt()));

  getIt.registerLazySingleton<HiveLocalDataSource>(
      () => HiveLocalDataSourceImpl(getIt()));
}

//* Repositories
void _setUpRepositories() {
  getIt.registerLazySingleton<PreferencesRepository>(
      () => PreferencesRepositoryImpl(getIt()));

  getIt.registerLazySingleton<TransactionTypesRepository>(() =>
      TransactionTypesRepositoryImpl(
          remoteDataSource: getIt(),
          localDataSource: getIt(),
          networkService: getIt()));

  getIt.registerLazySingleton<TransactionsRepository>(() =>
      TransactionsRepositoryImpl(
          remoteDataSource: getIt(), preferencesDataSource: getIt()));

  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      preferencesDataSource: getIt(),
      networkService: getIt()));

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      remoteDataSource: getIt(), preferencesDataSource: getIt()));

  getIt
      .registerLazySingleton<HiveRepository>(() => HiveRepositoryImpl(getIt()));
}

//* Use cases
void _setUpUseCases() {
  getIt.registerLazySingleton(() => GetUserId(getIt()));
  getIt.registerLazySingleton(() => StoreUserId(getIt()));

  getIt.registerLazySingleton(() => InitHiveLocalDatabase(getIt()));
  getIt.registerLazySingleton(() => CloseHiveLocalDatabase(getIt()));

  getIt.registerLazySingleton(() => GetTransactionTypes(getIt()));
  getIt.registerLazySingleton(() => GetUser(getIt()));

  getIt.registerLazySingleton(() => UpdateUser(getIt()));
  getIt.registerLazySingleton(() => ClearSharedData(getIt()));

  getIt.registerLazySingleton(() => RegisterUser(getIt()));
  getIt.registerLazySingleton(() => CreateTransation(getIt()));
  getIt.registerLazySingleton(() => RemoveTransation(getIt()));
}

//* Cores
void _setupCores() {
  getIt.registerLazySingleton<RouterService>(() => RouterServiceImpl());

  getIt.registerLazySingleton<NetworkService>(() => NetworkServiceImpl(
        getIt(),
      ));
}

//* Externals
Future<void> setupExternals() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);

  getIt.registerLazySingleton(() => InternetConnectionChecker());

  getIt.registerLazySingleton(() =>
      GraphQLClient(link: HttpLink(AppStrings.apiHost), cache: GraphQLCache()));
}
