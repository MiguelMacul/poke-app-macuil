import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokeappmacuil/model/pokemon_model.dart';
import 'package:pokeappmacuil/ui/widgets/loader.dart';
import 'package:pokeappmacuil/ui/widgets/tab_view_info_pokemon.dart';
import 'package:pokeappmacuil/utils/first_capital_letter.dart';
import 'package:pokeappmacuil/utils/string_color.dart';

class DetailPokemon extends StatelessWidget {
  const DetailPokemon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var pokemon = ModalRoute.of(context)!.settings.arguments as PokemonModel;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.favorite_border),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: StringColor.parse(
            text: pokemon == null ? "red" : pokemon.color!.name, opacity: 0.6),
        shadowColor: StringColor.parse(
            text: pokemon == null ? "red" : pokemon.color!.name, opacity: 0.6),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: StringColor.parse(
                      text: pokemon == null ? "red" : pokemon.color!.name,
                      opacity: 0.6,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: Container(
                    child: Text(
                      FirstCapitalLetter.firstCapitalLetter(pokemon.name),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.11,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: Row(
                    children: List.generate(pokemon.types!.length, (index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(bottom: 5, top: 5, right: 10),
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
                  top: MediaQuery.of(context).size.height * 0.08,
                  right: MediaQuery.of(context).size.width * 0.04,
                  child: Container(
                    child: Text(
                      "#${pokemon.id.toString().length == 1 ? "00${pokemon.id}" : pokemon.id.toString().length == 2 ? "0${pokemon.id}" : pokemon.id.toString()}",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.3,
                  right: -MediaQuery.of(context).size.width * 0.26,
                  child: Opacity(
                    opacity: 0.14,
                    child: Image.asset(
                      "assets/img/logo-pokemon.png",
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: TabViewInfoPokemon(pokemon: pokemon),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.06,
                  right: MediaQuery.of(context).size.width / 8,
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const Loader(),
                    errorWidget: (context, url, error) => const Loader(),
                    imageUrl:
                        pokemon.sprites!.other!.home!.frontDefault.toString(),
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
