abstract interface class AuthRemoteDataSource {
  Future<String> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}
