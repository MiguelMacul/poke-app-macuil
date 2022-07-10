import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokeappmacuil/model/pokemon_entitie.dart';
import 'package:pokeappmacuil/ui/widgets/loader.dart';

class ItemTeamPokemonCard extends StatelessWidget {
  PokemonEntitie pokemon;
  ItemTeamPokemonCard({required this.pokemon, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: MediaQuery.of(context).size.width * 0.004,
            offset: Offset(0, MediaQuery.of(context).size.width * 0.004),
          ),
        ],
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            placeholder: (context, url) => const Loader(),
            errorWidget: (context, url, error) => const Loader(),
            imageUrl: pokemon.imagen,
            width: MediaQuery.of(context).size.width * 0.14,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.01,
          ),
          Text(
            pokemon.nombre,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
