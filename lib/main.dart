import 'package:animations/animations.dart';
import 'package:civic_link/Authentication/user%20/Login.dart';
import 'package:civic_link/Authentication/user%20/Register.dart';
import 'package:civic_link/Home/Welcome_page.dart';
import 'package:civic_link/Home/citizen%20/complains.dart';
import 'package:civic_link/Home/citizen%20/Agencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Home/citizen /CitizenHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://vcouhytrfxxizokcqsmc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZjb3VoeXRyZnh4aXpva2Nxc21jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwODM1MzgsImV4cCI6MjA2ODY1OTUzOH0.gbp-HTUAI_wtWvcwpKswLAH0bcP6k4bsn1HZsWOCsfk',
  );
  runApp(ProviderScope(child: MyApp()));
}

final supabase = Supabase.instance.client;

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
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: Login(),
            transitionDuration: Duration(milliseconds: 1000),
            transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
                ) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
          );
        },      ),
      GoRoute(
        path: '/register',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: Register(),
            transitionDuration: Duration(milliseconds: 1000),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/complains',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: Complains(),
            transitionDuration: Duration(milliseconds: 1000),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/Agencies',
        builder: (BuildContext context, GoRouterState state) => Homepage(),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: CitizenHomePage(),
            transitionDuration: Duration(milliseconds: 1000),
            transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
                ) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
          );
        },
      ),
      /*   GoRoute(
        path: '/Admin',
        builder:
            (BuildContext context, GoRouterState state) => LoginScreenWeb(),
      ),
      GoRoute(
        path: '/AdminHome',
        builder: (BuildContext context, GoRouterState state) => AdminHome(),
      ),
      GoRoute(
        path: '/MyStatus',
        builder: (BuildContext context, GoRouterState state) => MyStatus(),
      ),*/
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white, size: 25, opacity: 2.0),
        ),
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
