import 'package:civic_link/widgets/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Account',
          style: GoogleFonts.brawler(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 80, top: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'Assets/profile.jpeg',
                  width: 250,
                  height: 250,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Account',
                style: GoogleFonts.brawler(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 800,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.shade800,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.settings, size: 30, color: Colors.white),
                        SizedBox(width: 20),
                        Text(
                          'Settings',
                          style: GoogleFonts.brawler(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 800,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.shade800,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.password_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Change Password',
                          style: GoogleFonts.brawler(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 800,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.shade800,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.help, size: 30, color: Colors.white),
                        SizedBox(width: 20),
                        Text(
                          'Help',
                          style: GoogleFonts.brawler(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 800,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.shade800,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.logout_rounded, size: 30, color: Colors.red),

                        SizedBox(width: 20),

                        Text(
                          'Sign Out',
                          style: GoogleFonts.brawler(
                            color: Colors.red,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'version 1.1',
                  style: GoogleFonts.brawler(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
