import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpNotifier extends StateNotifier<User?> {
  SignUpNotifier() : super(FirebaseAuth.instance.currentUser) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      state = user;
    });
  }

  Future<void> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = userCredential.user;
      print('sign In');
    } catch (e) {
      print("Sign-in error: $e");
    }
  }
}

final signUpProvider = StateNotifierProvider<SignUpNotifier, User?>((ref) {
  return SignUpNotifier();
});
