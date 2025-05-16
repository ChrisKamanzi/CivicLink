import 'package:civic_link/Home/WelcomePage.dart';
import 'package:civic_link/Introduction/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WelcomePage(),
        debugShowCheckedModeBanner: false);
  }
}
