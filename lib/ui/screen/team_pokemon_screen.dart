import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeappmacuil/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokeappmacuil/bloc/team/team_pokemon_bloc.dart';
import 'package:pokeappmacuil/ui/widgets/item_card_team.dart';
import 'package:pokeappmacuil/ui/widgets/loader.dart';

class TeamPokemonScreen extends StatefulWidget {
  const TeamPokemonScreen({Key? key}) : super(key: key);
  @override
  _TeamPokemonScreenState createState() => _TeamPokemonScreenState();
}

class _TeamPokemonScreenState extends State<TeamPokemonScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TeamPokemonBloc>(context, listen: false)
        .add(InicializarEquiposPokemonEvent());
  }

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
          return Container(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.05,
              left: MediaQuery.of(context).size.width * 0.05,
            ),
            color: Colors.white,
            child: Column(
              children: [
                Builder(builder: (context) {
                  if (state.equipos == null || state.equipos!.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      child: const Loader(),
                    );
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width * 0.42,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing:
                                MediaQuery.of(context).size.width * 0.03,
                            mainAxisSpacing:
                                MediaQuery.of(context).size.width * 0.03),
                        itemCount:
                            state.equipos != null ? state.equipos!.length : 0,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<TeamPokemonBloc>(context,
                                      listen: false)
                                  .add(
                                ActualizarEquiposPokemonEvent(
                                  integrantesEquipo: state.pokemons,
                                  equipo: state.equipos![index],
                                  equipos: state.equipos!,
                                  listadoGeneralPokemon:
                                      BlocProvider.of<PokemonBloc>(context,
                                                  listen: false)
                                              .state
                                              .pokemons ??
                                          [],
                                ),
                              );
                              Navigator.pushNamed(
                                context,
                                '/detail_team',
                              );
                            },
                            child: ItemCardTeam(equipo: state.equipos![index]),
                          );
                        },
                      ),
                    );
                  }
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
