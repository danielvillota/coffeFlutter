import 'package:go_router/go_router.dart';

import 'package:coffe/src/presentation/views/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
    ),
  ],
);