import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Model/complaint_model.dart';

class ComplaintNotifier extends StateNotifier<Complaint?> {
  ComplaintNotifier() : super(null);

  final supabase = Supabase.instance.client;

  Future<void> submitComplaint({
    required String title,
    required String description,
    required String status,
    required String department,
  }) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) throw Exception('User not signed in');
      final complaint = Complaint(
        title: title,
        description: description,
        department: department,
        status: 'pending',
        userId: user.id,
      );

      await supabase.from('complaints').insert({
        'title': complaint.title,
        'description': complaint.description,
        'department': complaint.department,
        'status': complaint.status,
        'userId': complaint.userId,
      });

      state = complaint;
    } catch (e, st) {
      throw Exception('Submit failed: $e');
    }
  }
}

final ComplainProvider = StateNotifierProvider<ComplaintNotifier, Complaint?>(
  (ref) => ComplaintNotifier(),
);
