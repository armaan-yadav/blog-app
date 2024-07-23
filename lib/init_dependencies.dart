import 'package:blog_app/core/secrets/supabase_secrets.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/data/data%20source/remote/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/data%20source/remote/firebase/auth_firebase_data_source.dart';
import 'package:blog_app/features/auth/data/data%20source/remote/supabase/auth_supabase_data_source.dart';
import 'package:blog_app/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/user_log_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  // final supabase = await Supabase.initialize(
  //   url: SupabaseSecrets.url,
  //   anonKey: SupabaseSecrets.anon,
  // );

  // serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  // serviceLocator.registerFactory<AuthSupabaseDataSource>(
  //     () => AuthSupabaseDataSource(serviceLocator<SupabaseClient>()));
  serviceLocator.registerLazySingleton(() => AuthFirebaseDataSource());

  serviceLocator.registerFactory<AuthRepositoryImplementation>(() =>
      AuthRepositoryImplementation(serviceLocator<AuthFirebaseDataSource>()));

  serviceLocator.registerFactory<UserSignUp>(
      () => UserSignUp(serviceLocator<AuthRepositoryImplementation>()));
  serviceLocator.registerFactory<UserLogIn>(
      () => UserLogIn(serviceLocator<AuthRepositoryImplementation>()));

  serviceLocator.registerLazySingleton<AuthBloc>(() => AuthBloc(
      userSignUp: serviceLocator<UserSignUp>(),
      userLogIn: serviceLocator<UserLogIn>()));
}
