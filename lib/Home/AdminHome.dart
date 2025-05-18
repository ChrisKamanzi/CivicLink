import 'package:civic_link/Providers/AdminSignInNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Providers/AdminComplaintNotifier.dart';
import '../widgets/ComplaintCard.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaints = ref.watch(adminComplaintProvider);

    final assignedDepartments = <String>{...complaints.map((c) => c.assigned)};
    final tabs = ['All', ...assignedDepartments];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Dashboard', style: GoogleFonts.poppins()),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await ref.read(AdminsignInProvider.notifier).signOut();
                context.go('/splash');
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        body: TabBarView(
          children:
              tabs.map((tab) {
                final filtered =
                    tab == 'All'
                        ? complaints
                        : complaints.where((c) => c.assigned == tab).toList();

                final sorted = [...filtered]..sort(
                  (a, b) =>
                      a.status == 'pending' && b.status != 'pending' ? -1 : 1,
                );

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: sorted.length,
                  itemBuilder: (_, i) => ComplaintCard(complaint: sorted[i]),
                );
              }).toList(),
        ),
      ),
    );
  }
}
