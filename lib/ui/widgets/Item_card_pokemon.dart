import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:pokeappmacuil/model/pokemon_model.dart';
import 'package:pokeappmacuil/utils/first_capital_letter.dart';
import 'package:pokeappmacuil/utils/string_color.dart';

class ItemCardPokemon extends StatelessWidget {
  final PokemonModel pokemon;
  final bool selected;
  final VoidCallback onTap;
  const ItemCardPokemon(
      {required this.pokemon,
      required this.selected,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected
              ? StringColor.parse(text: pokemon.color!.name, opacity: 0.2)
              : StringColor.parse(text: pokemon.color!.name, opacity: 0.6),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 0, left: 15, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Text(
                      FirstCapitalLetter.firstCapitalLetter(pokemon.name),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.05,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(pokemon.types!.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5, top: 5),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 2, bottom: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(100, 255, 250, 250),
                              ),
                              child: Text(
                                FirstCapitalLetter.firstCapitalLetter(
                                    pokemon.types![index].type!.name),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Positioned(
                      bottom: -MediaQuery.of(context).size.width * 0.06,
                      right: -MediaQuery.of(context).size.width * 0.11,
                      child: Opacity(
                        opacity: 0.14,
                        child: Image.asset(
                          "assets/img/logo-pokemon.png",
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.43,
                        ),
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width * 0.01,
                      bottom: MediaQuery.of(context).size.width * 0.02,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.sprites!.other!.home!.frontDefault
                            .toString(),
                        width: MediaQuery.of(context).size.width * 0.22,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
