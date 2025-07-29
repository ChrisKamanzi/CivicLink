import 'package:civic_link/Model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

final SignInProvider = StateNotifierProvider<SignInNotifier, AsyncValue<Client?>>(
  (ref) => SignInNotifier(),
);

class SignInNotifier extends StateNotifier<AsyncValue<Client?>> {
  SignInNotifier() : super(AsyncData(null));

  final supabase = Supabase.instance.client;

  Future<void> signIn(String email, String password, {bool? showLogs = false}) async {
    state = AsyncValue.loading();
    try {
      final response = await supabase.auth.signInWithPassword(email: email, password: password);
      final user = response.user; 
      
      if (user != null) {
        final client = Client(id: user.id, email: email, password: password);
        state = AsyncData(client);
        debugPrint('SignedIn auth : ${response}');
      }else{
        throw Exception("User Not Found");
      }
    }
    on SocketException catch (_) {
      final errMsg = "No internet connection. Please check your network.";
      if (showLogs == true) {
        debugPrint("Internet Connection $errMsg");
      }
      state = AsyncValue.error(errMsg, StackTrace.current);
    }
    catch (e, st) {
      if(showLogs == true);
      state =  AsyncValue.error(e, st);
    }
  }
  Future<void> signOut() async {
    await supabase.auth.signOut();
    state = AsyncValue.data(null);
  }
}
