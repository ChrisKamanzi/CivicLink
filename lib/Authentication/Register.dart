import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Providers/SignUpNotifier.dart';

class Register extends ConsumerWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInNotifier = ref.watch(signUpProvider.notifier);
    final _formKey = GlobalKey();

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, top: 50, right: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Register',
                style: GoogleFonts.inter(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 50),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      // controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 40),

                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 40),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(Icons.password),
                      ),
                    ),
                    SizedBox(height: 40),

                    TextFormField(
                      //     controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(Icons.password),
                      ),
                    ),

                    SizedBox(height: 70),

                    Container(
                      width: 300,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          await signInNotifier.signUp(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                          context.go('/login');
                        },

                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 100),

                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        children: [
                          Text(
                            'Dont have account?',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(width: 2),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign Up ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w800,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
