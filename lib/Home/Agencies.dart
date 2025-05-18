import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Services /Ministries.dart';
import '../widgets/BottomNavBar.dart';
import '../widgets/MinistriesCard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rwanda Ministries',
          style: GoogleFonts.brawler(
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: ministries.length,
          separatorBuilder: (_, __) => SizedBox(height: 20),
          itemBuilder: (context, index) {
            final ministry = ministries[index];
            return MinistryCard(
              title: ministry['name'],
              imagePath: ministry['image'],
              descriptionLines: List<String>.from(ministry['description']),
            );
          },
        ),
      ),
      bottomNavigationBar: Bottomnavbar(currentIndex: 2),
    );
  }
}
