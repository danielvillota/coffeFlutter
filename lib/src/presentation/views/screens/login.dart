import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffe/src/data/services/firebase/auth.dart';
import 'package:coffe/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:coffe/src/presentation/views/screens/login_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authService: _auth,
      ),
      child: const LoginView(),
    );
  }
}