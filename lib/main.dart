import 'package:blog_app/common/widgets/loader.dart';
import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/features/auth/data/data%20source/remote/firebase/auth_firebase_data_source.dart';
import 'package:blog_app/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/home_page.dart';
import 'package:blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:blog_app/init_dependencies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //good practice to do while doing an await call in the begining (before runApp())
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => serviceLocator<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
  // by default runApp has by default WidgetsFlutterBinding.ensureInitialised()
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const HomePage(),
    );
  }
}
