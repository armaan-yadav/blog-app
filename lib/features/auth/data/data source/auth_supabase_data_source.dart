//creatig an absract interface for  remote datasource
// so that if kalko we want to change the data source like firebase etc
// toh we can easily migrate
import 'package:blog_app/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

//actual implementation of supabase (remote) data source
//! Concrete Implementation
class AuthSupabaseDataSource implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthSupabaseDataSource(this.supabaseClient);

  @override
  Future<String> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          "name": name,
        },
      );
      if (response.user == null) {
        throw const ServerException("User is null!");
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
