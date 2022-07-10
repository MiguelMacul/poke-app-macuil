import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeappmacuil/bloc/team/team_pokemon_bloc.dart';
import 'package:pokeappmacuil/ui/widgets/item_team_pokemon_card.dart';
import 'package:pokeappmacuil/ui/widgets/loader.dart';

class DetailTeamScreen extends StatelessWidget {
  const DetailTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height * 0.23,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            BlocProvider.of<TeamPokemonBloc>(context, listen: false)
                .add(InicializarEquiposPokemonEvent());
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: -MediaQuery.of(context).size.width * 0.24,
                  right: -MediaQuery.of(context).size.width * 0.5,
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      "assets/img/logo-pokemon.png",
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width * 1.2,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.07,
                  child: Icon(Icons.list,
                      color: Colors.black,
                      size: MediaQuery.of(context).size.width * 0.1),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.07,
                  child: Text(
                    "Pokedex",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<TeamPokemonBloc, TeamPokemonState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: MediaQuery.of(context).size.width * 0.004,
                          offset: Offset(
                              0, MediaQuery.of(context).size.width * 0.004),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: Icon(
                      Icons.people,
                      color: Colors.black,
                      size: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                "Equipo",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                state.nombreEquipo.toString(),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                child: Builder(
                  builder: (context) {
                    if (state.pokemonsTeam == null) {
                      return const Loader();
                    } else {
                      return Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent:
                                        MediaQuery.of(context).size.width *
                                            0.42,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    mainAxisSpacing:
                                        MediaQuery.of(context).size.width *
                                            0.03),
                            itemCount: state.pokemonsTeam != null
                                ? state.pokemonsTeam!.length
                                : 0,
                            itemBuilder: (BuildContext ctx, index) {
                              return ItemTeamPokemonCard(
                                pokemon: state.pokemonsTeam![index],
                              );
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
