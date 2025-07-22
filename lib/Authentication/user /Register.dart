import 'package:civic_link/Providers/RegisterNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();

  final primaryColor = Color.fromRGBO(246, 27, 43, 100);
  final secondaryColor = Colors.white;
  final greyColor = Color.fromRGBO(97, 97, 97, 100);

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final client = ref.read(registerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Create Account',
            style: GoogleFonts.inter(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(231, 252, 60, 100),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Text(
                      'Let Start!',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: secondaryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 50),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 350,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(186, 27, 27, 1),
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _fullNameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: secondaryColor,
                                  labelText: 'Full Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? 'Enter your full name'
                                            : null,
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: secondaryColor,
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(Icons.email),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? 'Enter your email'
                                            : null,
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  fillColor: secondaryColor,
                                  filled: true,
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(Icons.lock),
                                ),
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? 'Enter a password'
                                            : null,
                              ),
                              const SizedBox(height: 24),
                              TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: secondaryColor,
                                  labelText: 'Confirm Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(Icons.lock_outline),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Confirm your password';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => _isLoading = true);
                                await ref.read(registerProvider.notifier).signUp(
                                  _emailController.text.trim().toLowerCase(),
                                  _passwordController.text.trim(),
                                 // _fullNameController.text.trim(),
                                );
                                setState(() => _isLoading = false);
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade800,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child:
                                _isLoading
                                    ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                    : Text(
                                      'Sign Up',
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
                              'Already have an account?',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            TextButton(
                              onPressed: () => context.push('/login'),
                              child: Text(
                                'Login',
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
