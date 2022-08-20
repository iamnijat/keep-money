import '../data_sources/local/preferences_data_source/preferences_data_source.dart';
import '../data_sources/remote/auth_remote_data_source/auth_remote_data_source.dart';

import '../../core/utils/either.dart';
import '../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final PreferencesDataSource preferencesDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.preferencesDataSource,
  });

  @override
  Future<Either<Failure, String>> register(String query,
      {Map<String, dynamic>? variables}) async {
    try {
      final registerResult = await remoteDataSource.register(
        query,
        variables: variables,
      );

      await preferencesDataSource
          .setUserId(registerResult.data?['createUser']["id"]);

      return Success(registerResult.data?['createUser']["id"]);
    } catch (_) {
      return const Error(Failure.other());
    }
  }
}
