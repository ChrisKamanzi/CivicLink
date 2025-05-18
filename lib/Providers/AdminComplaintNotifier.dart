import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Model/AdminComplaintModel.dart';

final adminComplaintProvider = StateNotifierProvider<AdminComplaintNotifier, List<Complaint>>((ref) {
  return AdminComplaintNotifier();
});

class AdminComplaintNotifier extends StateNotifier<List<Complaint>> {
  AdminComplaintNotifier() : super([]) {
    fetchComplaints();
  }

  final _firestore = FirebaseFirestore.instance;

  Future<void> fetchComplaints() async {
    final snapshot = await _firestore.collection('complaint').get();
    state = snapshot.docs.map((doc) => Complaint.fromMap(doc.data(), doc.id)).toList();
  }

  Future<void> submitReply(String docId, String reply) async {
    await _firestore.collection('complaint').doc(docId).update({
      'reply': reply,
      'status': 'replied',
    });
    await fetchComplaints();
  }
}
