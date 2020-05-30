import 'dart:convert';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
  int result;
  String one;
  String three;
  String two;

  Result({
    this.result,
    this.one,
    this.three,
    this.two,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    result: json["Result"],
    one: json["one"],
    three: json["three"],
    two: json["two"],
  );

  Map<String, dynamic> toJson() => {
    "Result": result,
    "one": one,
    "three": three,
    "two": two,
  };
}

