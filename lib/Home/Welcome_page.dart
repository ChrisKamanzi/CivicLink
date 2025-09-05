import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color.fromRGBO(246, 27, 43, 100);
    final secondaryColor = Colors.white;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset('Assets/logo.png', width: 200, height: 200),
            ),
            SizedBox(height: 20),
            Text(
              'loginScreen.title'.tr(),
              style: GoogleFonts.inter(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'loginScreen.description'.tr(),
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
            ),
            SizedBox(height: 48),

            // Login Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => context.push('/login'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: primaryColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'loginScreen.login'.tr(),
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => context.push('/register'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: primaryColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'loginScreen.signUp'.tr(),
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),

            TextButton(
              onPressed: () => context.push('/Admin'),
              child: Text(
                'loginScreen.admin'.tr(),
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
