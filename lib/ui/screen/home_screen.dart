import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeappmacuil/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokeappmacuil/bloc/team/team_pokemon_bloc.dart';
import 'package:pokeappmacuil/model/pokemon_model.dart';
import 'package:pokeappmacuil/ui/widgets/item_card_pokemon.dart';
import 'package:pokeappmacuil/ui/widgets/loader.dart';
import 'package:pokeappmacuil/ui/widgets/ventana_modal_team_pokemon.dart';
import 'package:pokeappmacuil/utils/global_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PokemonBloc>(context, listen: false)
        .add(GetConsultarApis(limiteMaximo: 50));

    BlocProvider.of<TeamPokemonBloc>(context, listen: false)
        .add(InicializarEquiposPokemonEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return BlocBuilder<TeamPokemonBloc, TeamPokemonState>(
          builder: (context, state2) {
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
                          child: IconButton(
                            icon: Icon(Icons.list,
                                color: Colors.black,
                                size: MediaQuery.of(context).size.width * 0.1),
                            onPressed: () async {
                              Navigator.pushNamed(context, '/team_pokemon');
                            },
                          ),
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.width * 0.05,
                          left: MediaQuery.of(context).size.width * 0.07,
                          child: Text(
                            "Pokedex",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        if (state2.esActiveGenerarTeam &&
                            BlocProvider.of<PokemonBloc>(context, listen: false)
                                    .state
                                    .pokemons !=
                                null)
                          Positioned(
                            bottom: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.07,
                            child: Text(
                              "Miembros  ${state.selected!.where((element) => element == true).length} de 6",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
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
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<TeamPokemonBloc>(context, listen: false).add(
                      ComenzarProcesoCrearTeam(
                          esActiveGenerarTeam: !state2.esActiveGenerarTeam));
                },
                backgroundColor: const Color(0xFF6C79DB),
                child: const Icon(
                  Icons.settings_input_composite_rounded,
                  color: Colors.white,
                ),
              ),
              body: Container(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Builder(builder: (context) {
                      if (state.pokemons == null) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.3),
                          child: const Loader(),
                        );
                      } else {
                        return Expanded(
                          child: GridView.builder(
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
                            itemCount: state.pokemons != null
                                ? state.pokemons!.length
                                : 0,
                            itemBuilder: (BuildContext ctx, index) {
                              return ItemCardPokemon(
                                pokemon: state.pokemons![index],
                                onTap: () => selectOpcion(
                                  index,
                                  isSelected: !state.selected![index],
                                  isTeam: state2.esActiveGenerarTeam,
                                  selectedPokemon: state.pokemons![index],
                                  teamPokemon: state2.pokemons ?? [],
                                  seleccionItemp: state.selected![index],
                                ),
                                selected: state.selected != null
                                    ? state.selected!.isNotEmpty
                                        ? state.selected![index]
                                        : false
                                    : false,
                              );
                            },
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void selectOpcion(int index,
      {bool isSelected = false,
      bool isTeam = false,
      required PokemonModel selectedPokemon,
      required List<PokemonModel> teamPokemon,
      bool seleccionItemp = false}) {
    if (isTeam) {
      BlocProvider.of<PokemonBloc>(context).add(
        ActualizarEstadoItem(index: index, estado: isSelected),
      );
      if (seleccionItemp) {
        teamPokemon.remove(selectedPokemon);
        BlocProvider.of<TeamPokemonBloc>(context).add(
          AgregarMiembroTeamPokemonEvent(
            pokemon: teamPokemon,
            esActiveGenerarTeam:
                BlocProvider.of<TeamPokemonBloc>(context, listen: false)
                    .state
                    .esActiveGenerarTeam,
            equipo: BlocProvider.of<TeamPokemonBloc>(context, listen: false)
                    .state
                    .equipos ??
                [],
          ),
        );
      } else {
        teamPokemon.add(selectedPokemon);
        BlocProvider.of<TeamPokemonBloc>(context).add(
          AgregarMiembroTeamPokemonEvent(
            pokemon: teamPokemon,
            esActiveGenerarTeam:
                BlocProvider.of<TeamPokemonBloc>(context, listen: false)
                    .state
                    .esActiveGenerarTeam,
            equipo: BlocProvider.of<TeamPokemonBloc>(context, listen: false)
                    .state
                    .equipos ??
                [],
          ),
        );
        if (teamPokemon.length == GlobalConstants.teamSize) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => VentanaModalTeamPokemon());
        }
      }
    } else {
      Navigator.pushNamed(
        context,
        '/detail_pokemon',
        arguments: selectedPokemon,
      );
    }
  }
}
