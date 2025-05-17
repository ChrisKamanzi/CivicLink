class Complaint {
  final String assigned;
  final String title;
  final String description;
  final String status;
  final String userId;

  Complaint({
    required this.assigned,
    required this.title,
    required this.description,
    required this.status,
    required this.userId,
  });

  factory Complaint.fromMap(Map<String, dynamic> map) {
    return Complaint(
      assigned: map['assigned'] ?? '',
      title: map['tittle'] ?? '',
      description: map['description'] ?? '',
      status: map['status'] ?? '',
      userId: map['userId'] ?? '',
    );
  }
}
