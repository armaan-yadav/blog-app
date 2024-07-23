import 'package:blog_app/features/auth/domain/usecases/user_log_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogIn _userLogIn;
  AuthBloc({required UserSignUp userSignUp, required UserLogIn userLogIn})
      : _userSignUp = userSignUp,
        _userLogIn = userLogIn,
        super(AuthInitial()) {
    on<AuthSignUp>(
      (event, emit) async {
        emit(AuthLoading());
        final response = await _userSignUp(UserSignUpParams(
          email: event.email,
          name: event.name,
          password: event.password,
        ));
        response.fold(
          (failure) => emit(
            AuthFailure(failure.errorMessage),
          ),
          (uid) => emit(
            AuthSuccess(uid),
          ),
        );
      },
    );
    on<AuthLogin>(
      (event, emit) async {
        emit(AuthLoading());
        final response =
            await _userLogIn(UserLogInParams(event.email, event.password));
        response.fold(
          (failure) => emit(
            AuthFailure(failure.errorMessage),
          ),
          (uid) => emit(
            AuthSuccess(uid),
          ),
        );
      },
    );
  }
}
