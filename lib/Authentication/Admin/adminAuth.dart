import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Providers/AdminSignInNotifier.dart';
import '../../Providers/SignInNotifier.dart';

final loginLoadingProvider = StateProvider<bool>((ref) => false);

class LoginScreenWeb extends ConsumerStatefulWidget {
  const LoginScreenWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreenWeb> createState() => _LoginScreenWebState();
}

class _LoginScreenWebState extends ConsumerState<LoginScreenWeb> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    ref.read(loginLoadingProvider.notifier).state = true;

    await ref
        .read(signInProvider.notifier)
        .signIn(_emailController.text.trim(), _passwordController.text.trim());

    ref.read(loginLoadingProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLoading = ref.watch(loginLoadingProvider);
    final user = ref.watch(AdminsignInProvider);

    ref.listen<User?>(signInProvider, (previous, next) {
      if (next != null && previous == null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });

    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: Container(
          width: screenWidth > 600 ? 400 : screenWidth * 0.9,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.shade200.withOpacity(0.5),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Admin Login",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange.shade800,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailController..text = 'admin@gmail.com',
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.orange.shade700),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.orange.shade300, width: 2),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.orange.shade700),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.orange.shade700),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.orange.shade700, width: 2),
                    ),
                    prefixIcon:
                    Icon(Icons.lock, color: Colors.orange.shade700),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                      if (!_formKey.currentState!.validate()) return;

                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();

                      if (email != 'admin@gmail.com') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Only admin login is allowed'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      ref.read(loginLoadingProvider.notifier).state = true;

                      await ref
                          .read(AdminsignInProvider.notifier)
                          .signIn(email, password);

                      ref.read(loginLoadingProvider.notifier).state = false;

                      context.go('/AdminHome');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      disabledBackgroundColor: Colors.orange.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
