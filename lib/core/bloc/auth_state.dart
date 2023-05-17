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

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}   
//Statelerin dinlenmesini işleyeceksin, örnekler chatGptde bulunuyor son konuşmaya bak anlayacaksındır. 
//Bu şekilde, SignUpFailure ve SignUpSuccess sınıflarını oluşturarak, başarısızlık durumunda SignUpFailure state'ini, 
//başarı durumunda ise SignUpSuccess state'ini yayınlayabilirsiniz.
