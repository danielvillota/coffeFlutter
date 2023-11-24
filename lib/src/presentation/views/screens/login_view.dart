import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coffe/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:coffe/src/utils/constants/colors.dart';
import 'package:coffe/src/presentation/views/widgets/form_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

 @override
  void initState() {
    super.initState();
    // Lógica para leer y asignar valores de SharedPreferences
    _loadSavedCredentials();
  }

  void _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    setState(() {
      _emailController.text = savedEmail ?? "";
      _passwordController.text = savedPassword ?? "";
    });
  }

  //fin

  void signIn(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    context.read<AuthBloc>().add(LoginEmailChangedEvent(email: email));
    context.read<AuthBloc>().add(LoginPasswordChangedEvent(password: password));
    context.read<AuthBloc>().add(const LoginButtonPressedEvent());
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          context.go('/home');
        }
        if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 170, left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/svg/logo.svg',
                          width: 100,
                          height: 100,
                        )
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Tu cafe a la mesa en minutos",
                          style: TextStyle(
                            color: textThird,
                            fontSize: 16,
                            
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.only(top: 35, bottom: 40),
                    width: sizeScreen.width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: FormContainer(
                            controller: _emailController,
                            hintText: "Email",
                            isPasswordField: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: FormContainer(
                            controller: _passwordController,
                            hintText: "Password",
                            isPasswordField: true,
                          ),
                        ),
                        const SizedBox(height: 35),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: GestureDetector(
                            onTap: () {
                              signIn(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  "Iniciar Sesión",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            context.go('/sign-up');
                          },
                          child: const Text(
                            "Registrate",
                            style: TextStyle(
                              color: primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}