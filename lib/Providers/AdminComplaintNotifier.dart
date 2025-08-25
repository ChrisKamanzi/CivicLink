import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Model/AdminComplaintModel.dart';

class ComplaintNotifier extends StateNotifier<List<Complaint>> {
  ComplaintNotifier() : super([]) {
    fetchComplaints();
  }

  final _supabase = Supabase.instance.client;

  Future<void> fetchComplaints() async {
    final response = await _supabase
        .from('complaints')
        .select()
        .order('submited_at', ascending: false);

    print('Fetched complaints from Supabase: $response');

    if (response != null && response is List) {
      state = response.map((e) => Complaint.fromJson(e)).toList();
    } else {
      state = [];
    }
  }

  Future<void> replyToComplaint({
    required int complaintId,
    required String response,
  }) async {
    try {
      final data = await _supabase
          .from('complaints')
          .update({'response': response, 'status': 'replied'})
          .eq('complaint_id', complaintId);

      state =
          state.map((c) {
            if (c.complaintId == complaintId) {
              return c.copyWith(response: response, status: 'replied');
            }
            return c;
          }).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

final complaintNotifierProvider =
    StateNotifierProvider<ComplaintNotifier, List<Complaint>>(
      (ref) => ComplaintNotifier(),
    );
