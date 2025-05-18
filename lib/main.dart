import 'package:civic_link/Authentication/Admin/adminAuth.dart';
import 'package:civic_link/Authentication/user%20/Login.dart';
import 'package:civic_link/Authentication/user%20/Register.dart';
import 'package:civic_link/Home/WelcomePage.dart';
import 'package:civic_link/Home/complains.dart';
import 'package:civic_link/Home/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'Home/AdminHome.dart';
import 'Home/CitizenHomePage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
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
        path: '/register',
        builder: (BuildContext context, GoRouterState state) => Register(),
      ),
      GoRoute(
        path: '/complains',
        builder: (BuildContext context, GoRouterState state) => Complains(),
      ),
      GoRoute(
        path: '/homepage',
        builder: (BuildContext context, GoRouterState state) => Homepage(),
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) => CitizenHomePage(),
      ),
      GoRoute(
        path: '/Admin',
        builder: (BuildContext context, GoRouterState state) => LoginScreenWeb(),
      ),
      GoRoute(
        path: '/AdminHome',
        builder: (BuildContext context, GoRouterState state) =>AdminHome(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
