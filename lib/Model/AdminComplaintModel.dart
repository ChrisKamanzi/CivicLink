class Complaint {
  final String id;
  final String tittle;
  final String description;
  final String status;
  final String assigned;
  final String userId;
  final String reply;


  Complaint({
    required this.id,
    required this.tittle,
    required this.description,
    required this.status,
    required this.assigned,
    required this.userId,
    required this.reply,

  });

  factory Complaint.fromMap(Map<String, dynamic> data, String id) {
    return Complaint(
      id: id,
      tittle: data['tittle'] ?? '',
      description: data['description'] ?? '',
      status: data['status'] ?? '',
      assigned: data['assigned'] ?? '',
      userId: data['userId'] ?? '',
      reply: data['reply'] ?? '',
    );
  }
}
