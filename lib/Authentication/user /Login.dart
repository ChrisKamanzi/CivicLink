import 'package:civic_link/Providers/SignInNotifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hasNavigated = false;

  final primaryColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final signInNotifier = ref.read(signInProvider.notifier);

    ref.listen<User?>(signInProvider, (previous, next) {
      if (next != null && !_hasNavigated) {
        _hasNavigated = true;
        context.go('/home');
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: screenWidth > 600 ? 400 : screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                          value == null || value.isEmpty ? 'Enter your email' : null,
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                          ),
                          validator: (value) =>
                          value == null || value.isEmpty ? 'Enter your password' : null,
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await signInNotifier.signIn(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            TextButton(
                              onPressed: () => context.push('/register'),
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
