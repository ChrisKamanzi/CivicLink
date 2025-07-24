import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Model/complaint_model.dart';

class MyComplainNotifier extends StateNotifier<List<Complaint>> {
  MyComplainNotifier() : super([]);

  final supabase = Supabase.instance.client;

  Future<void> fetchComplaint() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        state = [];
        return;
      }
      final response = await supabase
          .from('complaints')
          .select()
          .eq('userId', user.id);
      print('${response}');
      if (response is List) {
        state = response.map((e) => Complaint.fromJson(e)).toList();
      } else {
        state = [];
      }
    } catch (e) {
      print('error ${e}');
    }
  }
}
  final myComplaintProvider =
  StateNotifierProvider<MyComplainNotifier, List<Complaint>>(
        (ref) => MyComplainNotifier(),
  );
