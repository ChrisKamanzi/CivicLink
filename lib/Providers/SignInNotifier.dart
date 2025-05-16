import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInNotifier extends StateNotifier<User?> {
  SignInNotifier() : super(FirebaseAuth.instance.currentUser) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      state = user;
    });
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = userCredential.user;
      print('sign In');
    } catch (e) {
      print("Sign-in error: $e");
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    state = null;
  }
}

final signInProvider = StateNotifierProvider<SignInNotifier, User?>((ref) {
  return SignInNotifier();
});
