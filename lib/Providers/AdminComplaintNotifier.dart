import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/AdminComplaintModel.dart';

class AdminComplaintNotifier extends StateNotifier<List<Complaint>> {
  AdminComplaintNotifier() : super([]) {
    _loadComplaints();
  }

  void _loadComplaints() {
    FirebaseFirestore.instance
        .collection('complaint')
        .snapshots()
        .listen((snapshot) {
      state = snapshot.docs.map((doc) => Complaint.fromMap(doc.data())).toList();
    });
  }
}

final adminComplaintProvider =
StateNotifierProvider<AdminComplaintNotifier, List<Complaint>>((ref) {
  return AdminComplaintNotifier();
});
