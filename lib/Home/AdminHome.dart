import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Model/AdminComplaintModel.dart';
import '../Providers/AdminComplaintNotifier.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaints = ref.watch(adminComplaintProvider);

    final assignedDepartments = <String>{
      ...complaints.map((c) => c.assigned),
    };

    final tabs = ['All', ...assignedDepartments];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Complaints'),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((tab) {
            final filtered = tab == 'All'
                ? complaints
                : complaints.where((c) => c.assigned == tab).toList();
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filtered.length,
              itemBuilder: (_, i) => ComplaintCard(complaint: filtered[i]),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ComplaintCard extends StatelessWidget {
  final Complaint complaint;

  const ComplaintCard({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: ${complaint.title}", style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Description: ${complaint.description}"),
            const SizedBox(height: 8),
            Text("Status: ${complaint.status}", style: const TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            Text("Assigned to: ${complaint.assigned}", style: const TextStyle(color: Colors.green)),
            const SizedBox(height: 8),
            Text("User ID: ${complaint.userId}", style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
