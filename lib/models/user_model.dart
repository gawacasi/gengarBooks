class LoginResponse {
  final String? id;

  LoginResponse({this.id});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(id: json['user_id']);
  }
}
