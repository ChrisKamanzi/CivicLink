import 'package:civic_link/Authentication/Login.dart';
import 'package:civic_link/Authentication/Register.dart';
import 'package:civic_link/Home/HomePage.dart';
import 'package:civic_link/Home/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) => WelcomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => Login(),
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => Login(),
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) => Register(),
      ),
      GoRoute(
        path: '/homepage',
        builder: (BuildContext context, GoRouterState state) => HomePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
