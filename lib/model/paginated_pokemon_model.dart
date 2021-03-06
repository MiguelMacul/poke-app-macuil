import 'dart:convert';

PaginatedPokemonModel paginatedPokemonModelFromJson(String str) =>
    PaginatedPokemonModel.fromJson(json.decode(str));

String paginatedPokemonModelToJson(PaginatedPokemonModel data) =>
    json.encode(data.toJson());

class PaginatedPokemonModel {
  PaginatedPokemonModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<Result> results;

  factory PaginatedPokemonModel.fromJson(Map<String, dynamic> json) =>
      PaginatedPokemonModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
