import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  final String title;
  final String status;
  final VoidCallback? onTap;

  const StatusTile({
    super.key,
    required this.title,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text('Status: $status'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap ?? () {}, // Default empty action if not provided
      ),
    );
  }
}
