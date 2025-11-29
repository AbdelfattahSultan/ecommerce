class UserModel {
  final String name;
  final String email;
  final String role;

  UserModel({required this.name, required this.email, required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      role: json["role"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "role": role};
  }
}

class AuthResponseModel {
  final String message;
  final UserModel user;
  final String token;

  AuthResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json["message"] ?? "",
      user: UserModel.fromJson(json["user"]),
      token: json["token"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"message": message, "user": user.toJson(), "token": token};
  }
}
