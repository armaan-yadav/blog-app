import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/features/auth/data/data%20source/remote/auth_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseDataSource implements AuthRemoteDataSource {
  @override
  Future<String> logInWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement logInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    print("object");
    try {
      final response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(response);
      return response.user!.uid;
    } catch (e) {
      print(e);
      throw ServerException(e.toString());
    }
  }
}
