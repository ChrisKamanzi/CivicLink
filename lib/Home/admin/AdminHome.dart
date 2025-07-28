import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Model/AdminComplaintModel.dart';
import '../../Providers/AdminComplaintNotifier.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({super.key});

  void _showReplyDialog(
    BuildContext context,
    WidgetRef ref,
    Complaint complaint,
  ) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Reply to '${complaint.title}'"),
            content: TextField(
              controller: controller,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Type your response',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: const Text('Send Reply'),
                onPressed: () async {
                  Navigator.pop(context);

                  await ref
                      .read(complaintNotifierProvider.notifier)
                      .replyToComplaint(
                        complaintId: complaint.complaintId,
                        response: controller.text,
                      );
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaints = ref.watch(complaintNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Admin - All Complaints',
          style: GoogleFonts.brawler(color: Colors.white, fontSize: 25),
        ),
      ),
      body:
          complaints.isEmpty
              ? const Center(child: Text('No complaints found'))
              : ListView.builder(
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  final complaint = complaints[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Card(
                        color: Colors.transparent,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        child: ListTile(
                          title: Text(
                            complaint.title,
                            style: GoogleFonts.brawler(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                complaint.description,
                                style: GoogleFonts.brawler(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Dept: ${complaint.department}',
                                style: GoogleFonts.brawler(color: Colors.white, fontSize: 15),
                              ),
                              Text(
                                'Status: ${complaint.status}',
                                style: GoogleFonts.brawler(color: Colors.white,fontSize: 15 ),
                              ),
                              if (complaint.response != null)
                                Text(
                                  'Response: ${complaint.response}',
                                  style: GoogleFonts.brawler(color: Colors.green, fontSize: 15),
                                ),
                            ],
                          ),
                          trailing:
                              complaint.status == 'pending'
                                  ? IconButton(
                                    icon: const Icon(
                                      Icons.reply,
                                      color: Colors.red,
                                    ),
                                    onPressed:
                                        () => _showReplyDialog(
                                          context,
                                          ref,
                                          complaint,
                                        ),
                                  )
                                  : null,
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
