part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class LoginButtonPressedEvent extends AuthEvent {
  const LoginButtonPressedEvent();
}

class LoginEmailChangedEvent extends AuthEvent {
  final String email;
  const LoginEmailChangedEvent({required this.email});
}

class LoginPasswordChangedEvent extends AuthEvent {
  final String password;
  const LoginPasswordChangedEvent({required this.password});
}