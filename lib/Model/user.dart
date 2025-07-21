class Client {
  final String email;

  // final String fullName;
  final String password;
  final String userId;

  Client({
    required this.email,
    //  required this.fullName,
    required this.password,
    required this.userId,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      email: json['email'],
      // fullName: json['full_name'],
      password: '',
      userId: json['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'email': email,
      //'full_name': fullName,
    };
  }
}
