import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/services/network_service/network_service.dart';
import '../../core/utils/either.dart';
import '../../core/utils/user_data_util.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/local/preferences_data_source/preferences_data_source.dart';
import '../data_sources/local/user_local_data_source/user_local_data_source.dart';
import '../data_sources/remote/user_remote_data_source/user_remote_data_source.dart';
import '../models/hive_adapters/user_view_model/user_view_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final PreferencesDataSource preferencesDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkService networkService;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.preferencesDataSource,
    required this.localDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, UserViewModel?>> fetchUser(String query,
      {Map<String, dynamic>? variables}) async {
    if (await networkService.isConnected) {
      try {
        final userId = await preferencesDataSource.userId;

        final Map<String, dynamic> newVariables = {"id": userId};

        final result =
            await remoteDataSource.fetchUser(query, variables: newVariables);

        final userData = UserDataUtil.getUser(user: result.data?['user']);

        localDataSource.cacheUser(userData!);
        return Success(userData);
      } catch (_) {
        return const Error(Failure.other());
      }
    } else {
      try {
        final result = localDataSource.fetchCachedUser();
        return Success(result);
      } on CacheException {
        return const Error(Failure.cache());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUser(String query,
      {Map<String, dynamic>? variables}) async {
    try {
      final userId = await preferencesDataSource.userId;

      final Map<String, dynamic>? newVariables = variables;

      newVariables?['id'] = userId;

      await remoteDataSource.updateUser(query, variables: newVariables);

      return const Success(unit);
    } catch (_) {
      return const Error(Failure.other());
    }
  }
}
