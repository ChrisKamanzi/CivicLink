import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Providers/SignInNotifier.dart';

class Drawerr extends ConsumerWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(

  child :  Padding(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            TextButton(
              onPressed: () => context.push('/homepage'),
              child: Text(
                'Rwandan Ministries',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

SizedBox(height: 30,),
            TextButton(
              onPressed: () async {
                await ref.read(signInProvider.notifier).signOut();
                context.go('/splash');
              },
              child: Text(
                'Logout',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
