import 'dart:io';

import 'package:civic_link/Model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpNotifier extends StateNotifier<AsyncValue<Client?>> {
  SignUpNotifier() : super(const AsyncValue.data(null));

  final supabase = Supabase.instance.client;

  Future<void> signUp(
    String email,
    String password, {
    bool showLogs = false,
  }) async {
    state = AsyncValue.loading();
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user != null) {
        final client = Client(email: email, password: password, id: user.id);

        if (showLogs = true) {
          debugPrint("data sent : ${client}");
        }
        state = AsyncValue.data(client);
      }
    }
    on SocketException catch(_){
      final errMsg = ' No internet Connection';

      if (showLogs == true) {
        debugPrint ('No internet Connection');
      }
      state = AsyncValue.error(errMsg, StackTrace.current);
    }
    catch (e, st) {
      if (showLogs = true) debugPrint("Sign-up error: $e");
      state = AsyncValue.error(e, st);
    }
  }
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
      state = AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final registerProvider =
    StateNotifierProvider<SignUpNotifier, AsyncValue<Client?>>(
      (ref) => SignUpNotifier(),
    );
