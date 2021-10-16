import 'dart:convert';

Actor actorFromJson(String str) => Actor.fromJson(json.decode(str));

String actorToJson(Actor data) => json.encode(data.toJson());

class Actor {
  Actor({
    required this.actor,
  });

  String actor;

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        actor: json["actor"],
      );

  Map<String, dynamic> toJson() => {
        "actor": actor,
      };
}
