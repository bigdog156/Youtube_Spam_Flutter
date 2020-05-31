import 'dart:convert';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
  int result;
  String lenmatizer;
  String standardize;
  String tokens;
  String vector;
  Result({
    this.result,
    this.lenmatizer,
    this.standardize,
    this.tokens,
    this.vector
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    result: json["Result"],
    lenmatizer: json["lenmatizer"],
    standardize: json["standardize"],
    tokens: json["tokens"],
    vector: json["vector"],
  );

  Map<String, dynamic> toJson() => {
    "Result": result,
    "lenmatizer": lenmatizer,
    "standardize": standardize,
    "tokens": tokens,
    "vector": vector
  };
}


