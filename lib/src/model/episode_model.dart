// To parse this JSON data, do
// final eposideModel = eposideModelFromJson(jsonString);

import 'dart:convert';

EposideModel eposideModelFromJson(String str) {
  final jsonData = json.decode(str);
  return EposideModel.fromJson(jsonData);
}

String eposideModelToJson(EposideModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class EposideModel {
  Info info;
  List<Result> results;

  EposideModel({
    this.info,
    this.results,
  });

  factory EposideModel.fromJson(Map<String, dynamic> json) => new EposideModel(
        info: Info.fromJson(json["info"]),
        results: new List<Result>.from(
            json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": new List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  int count;
  int pages;
  String next;
  String prev;

  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => new Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class Result {
  int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  String created;

  Result({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: new List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": new List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created,
      };
}
