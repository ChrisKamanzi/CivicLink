import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Center(
              child: Text('CivicLink', style: GoogleFonts.inter(fontSize: 30)),
            ),
            SizedBox(height: 30),
            Text(
              'Report, Track , Resolve',
              style: GoogleFonts.inter(fontSize: 20),
            ),

            SizedBox(height: 50),

            Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  foregroundColor: Colors.white,
                ),
                onPressed: () => context.push('/login'),
                child: Text(
                  'Login',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  foregroundColor: Colors.white,
                ),
                onPressed: () => context.push('/register'),
                child: Text(
                  'Sign UP',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: TextButton(
                onPressed: ()=> context.push('/homepage'),
                child: Text(
                  'Continue As Guest',

                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.orange.shade800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
