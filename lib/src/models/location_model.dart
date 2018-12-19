// To parse this JSON data, do
// final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) {
  final jsonData = json.decode(str);
  return LocationModel.fromJson(jsonData);
}

String locationModelToJson(LocationModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class LocationModel {
  Info info;
  List<Result> results;

  LocationModel({
    this.info,
    this.results,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      new LocationModel(
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
  String type;
  String dimension;
  List<String> residents;
  String url;
  String created;

  Result({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: new List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": new List<dynamic>.from(residents.map((x) => x)),
        "url": url,
        "created": created,
      };
}
