// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:ai_ecommerce/core/models/enums.dart';
import 'package:ai_ecommerce/core/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        final result = await authRepository.signUp(
          email: event.email,
          password: event.password,
        );
        if (result) {
          emit(SignUpSuccess());
        } else {
          emit(SignUpFailure());
        }
      } catch (e) {
        emit(SignUpFailure());
      }
    });

    on<SignInRequested>((event, emit) async {
      emit(Loading());
      try {
        final result = await authRepository.signIn(
            email: event.email, password: event.password);
        if (result == SignInState.emailNotVerified) {
          emit(SignInFailure());
        } else if (result == SignInState.signInSuccess) {
          emit(SignInSuccess());
        } else {
          emit(SignInFailure());
        }
      } catch (e) {
        emit(SignInFailure());
      }
    });
  }

  @override
  Future<void> close() {
    // _signUpStateController.close()
    return super.close();
  }
}
