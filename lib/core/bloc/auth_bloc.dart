// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:ai_ecommerce/core/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  // bool _signUpState = false;
  // final _signUpStateController = StreamController<bool>.broadcast();

  // Stream<bool> get signUpStateStream => _signUpStateController.stream;
  // bool get signUpState => _signUpState;

  // AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
  //   on<SignUpRequested>((event, state) async {
  //     emit(Loading());
  //     try {
  //       final result = await authRepository.signUp(
  //         email: event.email,
  //         password: event.password,
  //       );
  //       _signUpState = result;
  //       _signUpStateController.add(_signUpState);

  //       if (_signUpState) {
  //         '$_signUpState deneme1'.log();
  //       } else {
  //         '$_signUpState deneme2'.log();
  //       }
  //     } catch (e) {
  //       emit(UnAuthenticated());
  //     }
  //   });
  // }

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
  }

  @override
  Future<void> close() {
    // _signUpStateController.close()
    return super.close();
  }
}
