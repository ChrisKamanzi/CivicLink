import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Submit'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Agencies'),
      ],
    );
  }
}
