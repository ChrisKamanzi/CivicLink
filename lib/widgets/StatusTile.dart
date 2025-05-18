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
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.orange, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        subtitle: Text(
          'Status: $status',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
