import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.username,
  });

  String username;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
