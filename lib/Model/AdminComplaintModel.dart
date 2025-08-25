class Complaint {
  final int complaintId;
  final String title;
  final String description;
  final String department;
  final String status;
  final String? response;
  final DateTime submittedAt;

  Complaint({
    required this.complaintId,
    required this.title,
    required this.description,
    required this.department,
    required this.status,
    this.response,
    required this.submittedAt,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      complaintId: json['complaint_id'],
      title: json['title'],
      description: json['description'],
      department: json['department'],
      status: json['status'] ?? 'pending',
      response: json['response'],
      submittedAt: DateTime.parse(json['submited_at']),
    );
  }

  Complaint copyWith({String? response, String? status}) {
    return Complaint(
      complaintId: complaintId,
      title: title,
      description: description,
      department: department,
      status: status ?? this.status,
      response: response ?? this.response,
      submittedAt: submittedAt,
    );
  }
}
