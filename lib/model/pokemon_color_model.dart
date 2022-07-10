import 'dart:convert';

PokemonColorModel pokemonColorModelFromJson(String str) =>
    PokemonColorModel.fromJson(json.decode(str));

class PokemonColorModel {
  PokemonColorModel({
    this.baseHappiness,
    this.captureRate,
    required this.color,
    this.eggGroups,
    this.evolutionChain,
    this.evolvesFromSpecies,
    this.flavorTextEntries,
    this.formDescriptions,
    this.formsSwitchable,
    this.genderRate,
    this.genera,
    this.generation,
    this.growthRate,
    this.habitat,
    this.hasGenderDifferences,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.names,
    this.order,
    this.palParkEncounters,
    this.pokedexNumbers,
    this.shape,
    this.varieties,
  });

  int? baseHappiness;
  int? captureRate;
  Color color;
  List<Color>? eggGroups;
  EvolutionChain? evolutionChain;
  Color? evolvesFromSpecies;
  List<FlavorTextEntry>? flavorTextEntries;
  List<dynamic>? formDescriptions;
  bool? formsSwitchable;
  int? genderRate;
  List<Genus>? genera;
  Color? generation;
  Color? growthRate;
  Color? habitat;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  List<Name>? names;
  int? order;
  List<PalParkEncounter>? palParkEncounters;
  List<PokedexNumber>? pokedexNumbers;
  Color? shape;
  List<Variety>? varieties;

  factory PokemonColorModel.fromJson(Map<String, dynamic> json) =>
      PokemonColorModel(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        eggGroups:
            List<Color>.from(json["egg_groups"].map((x) => Color.fromJson(x))),
        evolutionChain: EvolutionChain.fromJson(json["evolution_chain"]),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        formDescriptions:
            List<dynamic>.from(json["form_descriptions"].map((x) => x)),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: List<Genus>.from(json["genera"].map((x) => Genus.fromJson(x))),
        generation: Color.fromJson(json["generation"]),
        growthRate: Color.fromJson(json["growth_rate"]),
        habitat: Color.fromJson(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        order: json["order"],
        palParkEncounters: List<PalParkEncounter>.from(
            json["pal_park_encounters"]
                .map((x) => PalParkEncounter.fromJson(x))),
        pokedexNumbers: List<PokedexNumber>.from(
            json["pokedex_numbers"].map((x) => PokedexNumber.fromJson(x))),
        shape: Color.fromJson(json["shape"]),
        varieties: List<Variety>.from(
            json["varieties"].map((x) => Variety.fromJson(x))),
        color: Color.fromJson(json["color"]),
      );
}

class Color {
  Color({
    required this.name,
    this.url,
  });

  String name;
  String? url;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
  @override
  String toString() {
    return 'Color{name: $name, url: $url}';
  }
}

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });

  String url;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  String flavorText;
  Color language;
  Color version;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Color.fromJson(json["language"]),
        version: Color.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language.toJson(),
        "version": version.toJson(),
      };
}

class Genus {
  Genus({
    required this.genus,
    required this.language,
  });

  String genus;
  Color language;

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: Color.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
        "language": language.toJson(),
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  Color language;
  String name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: Color.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
      };
}

class PalParkEncounter {
  PalParkEncounter({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  Color area;
  int baseScore;
  int rate;

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      PalParkEncounter(
        area: Color.fromJson(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "area": area.toJson(),
        "base_score": baseScore,
        "rate": rate,
      };
}

class PokedexNumber {
  PokedexNumber({
    required this.entryNumber,
    required this.pokedex,
  });

  int entryNumber;
  Color pokedex;

  factory PokedexNumber.fromJson(Map<String, dynamic> json) => PokedexNumber(
        entryNumber: json["entry_number"],
        pokedex: Color.fromJson(json["pokedex"]),
      );

  Map<String, dynamic> toJson() => {
        "entry_number": entryNumber,
        "pokedex": pokedex.toJson(),
      };
}

class Variety {
  Variety({
    required this.isDefault,
    required this.pokemon,
  });

  bool isDefault;
  Color pokemon;

  factory Variety.fromJson(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: Color.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "is_default": isDefault,
        "pokemon": pokemon.toJson(),
      };
}
