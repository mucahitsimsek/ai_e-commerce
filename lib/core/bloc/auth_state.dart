part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpFailure extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignInFailure extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignInSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}   

