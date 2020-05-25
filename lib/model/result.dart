import 'dart:convert';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
  int result;

  Result({
    this.result,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    result: json["Result"],
  );

  Map<String, dynamic> toJson() => {
    "Result": result,
  };
}

