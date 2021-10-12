import 'dart:convert';

Output outputFromJson(String str) => Output.fromJson(json.decode(str));

String outputToJson(Output data) => json.encode(data.toJson());

class Output {
  Output({
    required this.result,
  });

  bool result;

  factory Output.fromJson(Map<String, dynamic> json) => Output(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}
