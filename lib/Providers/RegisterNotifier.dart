import 'package:civic_link/Model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpNotifier extends StateNotifier<Client?> {
  SignUpNotifier() : super(null);

  final supabase = Supabase.instance.client;

  Future<void> signUp(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        final client = Client(
          email: email,
          password: password,
          userId: user.id,
        );

        state = client;
      }
    } catch (e) {
      print("Sign-up error: $e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    state = null;
  }
}

final registerProvider = StateNotifierProvider<SignUpNotifier, Client?>(
  (ref) => SignUpNotifier(),
);
