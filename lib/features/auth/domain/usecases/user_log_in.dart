import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserLogIn implements Usecase<String, UserLogInParams> {
  final AuthRepository authRepository;

  UserLogIn(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserLogInParams params) async {
    return await authRepository.logInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLogInParams {
  final String email;
  final String password;

  UserLogInParams(this.email, this.password);
}
