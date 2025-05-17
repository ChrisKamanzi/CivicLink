import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/complaintModel.dart';

class ComplaintNotifier extends StateNotifier<AsyncValue<void>> {
  ComplaintNotifier() : super(const AsyncData(null));

  Future<void> submitComplaint({
    required String title,
    required String description,
    required String assignedAgency,
  }) async {
    state = const AsyncLoading();

    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) throw Exception('User not signed in');

      final complaint = Complaint(
        title: title,
        description: description,
        assignedAgency: assignedAgency,
        userId: uid,
      );

      final docRef = await FirebaseFirestore.instance
          .collection('complaint')
          .add(complaint.toMap());

      print("✅ Complaint added with ID: ${docRef.id}");

      state = const AsyncData(null);
    } catch (e, st) {
      print("❌ Error submitting complaint: $e");
      state = AsyncError(e, st);
    }
  }
}

final complaintProvider =
StateNotifierProvider<ComplaintNotifier, AsyncValue<void>>(
      (ref) => ComplaintNotifier(),
);
