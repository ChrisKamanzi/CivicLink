
class Complaint {
  final String title;
  final String description;
  final String assignedAgency;
  final String status;
  final String userId;

  Complaint({
    required this.title,
    required this.description,
    required this.assignedAgency,
    this.status = 'pending',
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'tittle': title,
      'description': description,
      'assigned': assignedAgency,
      'status': status,
      'userId': userId,
    };
  }
}
