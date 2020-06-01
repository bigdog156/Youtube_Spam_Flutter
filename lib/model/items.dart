import 'dart:convert';

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items({
    this.multi,
    this.results,
  });

  String multi;
  List<List<dynamic>> results;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    multi: json["Multi"],
    results: List<List<dynamic>>.from(json["results"].map((x) => List<dynamic>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "Multi": multi,
    "results": List<dynamic>.from(results.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}
