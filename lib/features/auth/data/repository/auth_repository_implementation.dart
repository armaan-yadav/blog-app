import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/data/data%20source/remote/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImplementation implements AuthRepository {
  //again dependency injection
  // we dont want AuthRepositoryImplementation to be directly dependent on AuthRemoteDatSource
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userId = await remoteDataSource.logInWithEmailAndPassword(
          email: email, password: password);
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(
        userId,
      );
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }
}
