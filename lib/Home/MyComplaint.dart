import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Providers/UserComplaints.dart';
import '../widgets/BottomNavBar.dart';
import '../widgets/Drawer.dart';
import '../widgets/StatusTile.dart';

class MyStatus extends ConsumerWidget {
  const MyStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaints = ref.watch(citizenComplaintProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Citizen Portal',
          style: GoogleFonts.inter(
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white),
          ),),
        actions: [
          IconButton(icon: Icon(Icons.notifications, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.person, color: Colors.white), onPressed: () {}),
        ],
      ),
      drawer: Drawerr(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                'Your Complaints',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12),

              complaints.isEmpty
                  ? const Text('No complaints submitted yet.')
                  : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  final complaint = complaints[index];
                  return StatusTile(
                    title: complaint.tittle,
                    status: complaint.status,
                    onTap: () {
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }
}
