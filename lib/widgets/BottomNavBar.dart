import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Bottomnavbar extends StatelessWidget {
  final int currentIndex;

  const Bottomnavbar({super.key, this.currentIndex = 0});

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/complains');
        break;
      case 2:
        context.go('/Agencies');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      backgroundColor: Colors.white38,
      color: Colors.black,
      buttonBackgroundColor: Colors.red,
      height: 50,
      animationDuration: const Duration(milliseconds: 300),
      items: const [
        Icon(Icons.home, size: 28, color: Colors.white),
        Icon(Icons.add_circle_outline, size: 28, color: Colors.white),
        Icon(Icons.person, size: 28, color: Colors.white),
      ],
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
