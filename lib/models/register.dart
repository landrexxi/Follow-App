import 'dart:convert';

SingUp registerFromJson(String str) => SingUp.fromJson(json.decode(str));

String registerToJson(SingUp data) => json.encode(data.toJson());

class SingUp {
  SingUp({
    required this.username,
  });

  String username;

  factory SingUp.fromJson(Map<String, dynamic> json) => SingUp(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
