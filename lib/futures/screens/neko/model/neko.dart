// To parse this JSON data, do
//
//     final result = resultFromJson(jsonString);

import 'dart:convert';

class Result {
  List<Neko> results;

  Result({
    required this.results,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    results: List<Neko>.from(json["results"].map((x) => Neko.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Neko {
  String animeName;
  String url;

  Neko({
    required this.animeName,
    required this.url,
  });

  factory Neko.fromRawJson(String str) => Neko.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Neko.fromJson(Map<String, dynamic> json) => Neko(
    animeName: json["anime_name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "anime_name": animeName,
    "url": url,
  };
}
