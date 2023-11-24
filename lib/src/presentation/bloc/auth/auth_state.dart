part of 'auth_bloc.dart';

enum LoginStatus {
  success,
  failure,
  loading,
}

class AuthState extends Equatable {
  final String message;
  final LoginStatus status;
  final String email;
  final String password;

  const AuthState({
    this.message = '',
    this.status = LoginStatus.loading,
    this.email = '',
    this.password = '',
  });

  AuthState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? message,
  }) =>
      AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        message,
        status,
        email,
        password,
      ];
}