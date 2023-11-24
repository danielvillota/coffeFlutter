import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:coffe/src/data/services/firebase/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthService _authService;

  AuthBloc({
    required FirebaseAuthService authService,
  })  : _authService = authService,
        super(const AuthState()) {
    on<LoginButtonPressedEvent>(_handleLoginWithEmailAndPasswordEvent);
    on<LoginEmailChangedEvent>(_handleLoginEmailChangedEvent);
    on<LoginPasswordChangedEvent>(_handleLoginPasswordChangedEvent);
  }

  void _handleLoginEmailChangedEvent(
    LoginEmailChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _handleLoginPasswordChangedEvent(
    LoginPasswordChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handleLoginWithEmailAndPasswordEvent(
    LoginButtonPressedEvent event,
    Emitter<AuthState> emit,
  ) async {
    User? user = await _authService.signInWithEmailAndPassword(
      state.email,
      state.password,
    );

    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', state.email);
      await prefs.setString('password', state.password);
      emit(state.copyWith(message: 'Success', status: LoginStatus.success));
    } else {
      emit(
        state.copyWith(
            message: 'The user / password incorrect',
            status: LoginStatus.failure),
      );
    }
  }
}