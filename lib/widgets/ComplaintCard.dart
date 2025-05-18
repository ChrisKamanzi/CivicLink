import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/AdminComplaintModel.dart';
import '../Providers/AdminComplaintNotifier.dart';

class ComplaintCard extends ConsumerWidget {
  final Complaint complaint;

  const ComplaintCard({super.key, required this.complaint});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: complaint.status == 'pending' ? Colors.orange.shade50 : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => _showReplyDialog(context, ref, complaint),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                complaint.tittle,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                complaint.description,
                style: GoogleFonts.poppins(color: Colors.grey.shade900),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Chip(
                    label: Text(
                      complaint.status,
                      style: TextStyle(
                        color: complaint.status == 'pending'
                            ? Colors.orange.shade900
                            : Colors.green.shade900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: complaint.status == 'pending'
                        ? Colors.orange.shade200
                        : Colors.green.shade200,
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.account_tree_outlined, size: 16, color: Colors.orange.shade700),
                  const SizedBox(width: 4),
                  Text(
                    complaint.assigned,
                    style: GoogleFonts.poppins(color: Colors.orange.shade700),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'User ID: ${complaint.userId}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),

              if (complaint.reply.isNotEmpty) ...[
                const SizedBox(height: 12),
                ExpansionTile(
                  title: Text(
                    "Admin Reply",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.orange.shade800,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        complaint.reply,
                        style: GoogleFonts.poppins(color: Colors.grey.shade900),
                      ),
                    )
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _showReplyDialog(BuildContext context, WidgetRef ref, Complaint complaint) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Reply to Complaint",
            style: GoogleFonts.poppins(color: Colors.orange.shade800),
          ),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Your reply',
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange.shade700, width: 2),
              ),
              labelStyle: TextStyle(color: Colors.orange.shade700),
            ),
            maxLines: 4,
          ),
          actions: [
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.orange.shade700),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade700,
              ),
              child: const Text("Submit Reply"),
              onPressed: () async {
                final reply = controller.text.trim();
                if (reply.isEmpty) return;

                await ref
                    .read(adminComplaintProvider.notifier)
                    .submitReply(complaint.id, reply);

                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Reply submitted')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
