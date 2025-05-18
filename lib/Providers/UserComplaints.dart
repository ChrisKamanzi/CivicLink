import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Model/AdminComplaintModel.dart';

final citizenComplaintProvider =
     StateNotifierProvider<CitizenComplaintNotifier, List<Complaint>>((ref) {
      return CitizenComplaintNotifier();
    });

class CitizenComplaintNotifier extends StateNotifier<List<Complaint>> {
  CitizenComplaintNotifier() : super([]) {
    fetchUserComplaints();
  }
  final _firestore = FirebaseFirestore.instance;
  Future<void> fetchUserComplaints() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      state = [];
      return;
    }

    final snapshot =
        await _firestore
            .collection('complaint')
            .where('userId', isEqualTo: userId)
            .get();

    state =
        snapshot.docs
            .map((doc) => Complaint.fromMap(doc.data(), doc.id))
            .toList();
  }
}
