import 'dart:convert';

Multi multiFromJson(String str) => Multi.fromJson(json.decode(str));

String multiToJson(Multi data) => json.encode(data.toJson());

class Multi {
  Multi({
    this.multi,
  });

  String multi;

  factory Multi.fromJson(Map<String, dynamic> json) => Multi(
    multi: json["Multi"],
  );

  Map<String, dynamic> toJson() => {
    "Multi": multi,
  };
}
