import 'dart:convert';

EggPokemonModel eggPokemonModelFromJson(String str) =>
    EggPokemonModel.fromJson(json.decode(str));

String eggPokemonModelToJson(EggPokemonModel data) =>
    json.encode(data.toJson());

class EggPokemonModel {
  EggPokemonModel({
    required this.id,
    required this.name,
    required this.names,
    required this.pokemonSpecies,
  });

  int id;
  String name;
  List<Name> names;
  List<PokemonSpecy> pokemonSpecies;

  factory EggPokemonModel.fromJson(Map<String, dynamic> json) =>
      EggPokemonModel(
        id: json["id"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pokemonSpecies: List<PokemonSpecy>.from(
            json["pokemon_species"].map((x) => PokemonSpecy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "pokemon_species":
            List<dynamic>.from(pokemonSpecies.map((x) => x.toJson())),
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  PokemonSpecy language;
  String name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: PokemonSpecy.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
      };
}

class PokemonSpecy {
  PokemonSpecy({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokemonSpecy.fromJson(Map<String, dynamic> json) => PokemonSpecy(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
