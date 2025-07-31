import 'package:carousel_slider/carousel_slider.dart';
import 'package:civic_link/Providers/SignInNotifier.dart';
import 'package:civic_link/widgets/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../widgets/Drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CitizenHomePage extends ConsumerWidget {
  const CitizenHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Color.fromRGBO(246, 27, 43, 100);
    final secondaryColor = Colors.white;
    final greyColor = Color.fromRGBO(97, 97, 97, 100);

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        //  leading: Icon(icon),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'Citizen Portal',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: secondaryColor,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await ref.read(SignInProvider.notifier).signOut();
              context.go('/splash');
            },
          ),
        ],
      ),
      drawer: Drawerr(),
      body: Padding(
        padding: EdgeInsets.only(left: 16, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items:
                    [
                      'Assets/complain.png',
                      'Assets/complain2.png',
                      'Assets/complain3.png',
                    ].map((imagePath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    }).toList(),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.85,
                ),
              ),
              SizedBox(height: 30),

              //   Lottie.asset('Assets/people.json'),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.report),
                      label: Text(
                        'Send Complaint',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      ),
                      onPressed: () => context.push('/complains'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: greyColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.track_changes),
                      label: Text(
                        'Track Status',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      ),
                      onPressed: () => context.push('/MyStatus'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              Text(
                'Top News',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: secondaryColor,
                  ),
                ),
              ),

              SizedBox(height: 40),
              Container(
                height: 150,
                padding: EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MTN Rwanda fined over network disruption",
                      style: GoogleFonts.brawler(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Read more 👉',
                      style: GoogleFonts.itim(color: Colors.red,
                      fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 150,
                padding: EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Digital payment system will end mis allocation of school fees",
                      style: GoogleFonts.brawler(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Read more 👉',
                      style: GoogleFonts.itim(color: Colors.red,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 150,
                padding: EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Water shortage explained as govt seeks long-term solution",
                      style: GoogleFonts.brawler(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Read more 👉',
                      style: GoogleFonts.itim(color: Colors.red,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: const Bottomnavbar(),
    );
  }
}
