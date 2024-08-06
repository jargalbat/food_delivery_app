import 'package:flutter/material.dart';
import 'package:food_delivery_app/modules/signup/screens/password_screen.dart';
import 'package:food_delivery_app/modules/signup/screens/signup_screen.dart';
import 'package:food_delivery_app/modules/signup/screens/verification_screen.dart';
import 'package:go_router/go_router.dart';
import '../modules/auth/screens/login_screen.dart';
import '../modules/home/screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) =>
          const SignupScreen(),
    ),
    GoRoute(
      path: '/verify',
      builder: (BuildContext context, GoRouterState state) =>
          const VerificationScreen(),
    ),
    GoRoute(
      path: '/password',
      builder: (BuildContext context, GoRouterState state) =>
          const PasswordScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
  ],
);
