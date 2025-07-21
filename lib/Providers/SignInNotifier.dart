import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Model/user.dart';

class SignInNotifier extends StateNotifier<Client?> {
  SignInNotifier() : super(null);

  final supabase = Supabase.instance.client;

  Future<void> signIn(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        throw Exception('Sign-in failed');
      }

      state = Client(
        email: email,
        password: password,
        userId: user.id,
      );
    } catch (e) {
      print("Sign-in error: $e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    state = null;
  }
}

final SignInProvider = StateNotifierProvider<SignInNotifier, Client?>(
  (ref) => SignInNotifier(),
);
