import 'package:flutter/material.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
    currentIndex: 0,
    items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Submit'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ],
    );
  }
}
