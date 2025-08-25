import 'package:civic_link/Providers/UserComplaints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/BottomNavBar.dart';
import '../../widgets/Drawer.dart';

class MyStatus extends ConsumerStatefulWidget {
  const MyStatus({super.key});

  @override
  ConsumerState<MyStatus> createState() => _MyStatusState();
}

class _MyStatusState extends ConsumerState<MyStatus> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(myComplaintProvider.notifier).fetchComplaint();
    });
  }

  @override
  Widget build(BuildContext context) {
    final complaints = ref.watch(myComplaintProvider);
    final secondaryColor = Colors.white;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Citizen Portal',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawerr(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Your Complaints',
              style: GoogleFonts.inter(
                color: secondaryColor,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: complaints.isEmpty
                  ? Center(
                child: Text(
                  'No complaints found',
                  style: TextStyle(color: secondaryColor),
                ),
              )
                  : ListView.builder(
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  final complaint = complaints[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10, // optional light background
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Card(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  complaint.title,
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                complaint.description,
                                style: TextStyle(
                                  color: secondaryColor.withOpacity(0.9),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    complaint.status,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }
}
