class Complaint {

  final String title;
  final String description;
  final String status;
  final String userId;
  final String department;

  Complaint({
    required this.title,
    required this.description,
    this.status = 'pending',
    required this.userId,
    required this.department
  });

  Map<String, dynamic> toJson() {

    return {
      'title': title,
      'description': description,
      'status': status,
      'userId': userId,
      "department": department
    };
  }
  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
        title: json ['title'],
        description: json['description'],
        userId: json['userId'],
        department: json['department']
    );
  }
}
