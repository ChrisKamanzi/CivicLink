import 'package:civic_link/Providers/SignInNotifier.dart';
import 'package:civic_link/widgets/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/CategoryCards.dart';
import '../widgets/Drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CitizenHomePage extends ConsumerWidget {
  const CitizenHomePage({super.key});

  final primaryColor = Colors.orange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text(
          'Citizen Portal',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(signInProvider.notifier).signOut();
              context.go('/splash');
            },
          ),
        ],
      ),
      drawer: Drawerr(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back 👋',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
                        backgroundColor: primaryColor,
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
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Categories',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  CategoryCard(icon: Icons.local_hospital, label: 'Health'),
                  CategoryCard(icon: Icons.add_road, label: 'Infrastructure'),
                  CategoryCard(icon: Icons.water_drop, label: 'Water'),
                  CategoryCard(icon: Icons.electrical_services, label: 'Electricity'),
                  CategoryCard(icon: Icons.security, label: 'Safety'),
                  CategoryCard(icon: Icons.more_horiz, label: 'Other'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Bottomnavbar(),
    );
  }
}
