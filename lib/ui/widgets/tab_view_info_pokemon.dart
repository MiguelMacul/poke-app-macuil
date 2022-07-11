import 'package:flutter/material.dart';
import 'package:pokeappmacuil/model/pokemon_model.dart';
import 'package:pokeappmacuil/utils/global_constants.dart';

class TabViewInfoPokemon extends StatelessWidget {
  PokemonModel pokemon;
  TabViewInfoPokemon({required this.pokemon, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: GlobalConstants.tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              tabs: GlobalConstants.tabs,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              unselectedLabelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.025,
                fontWeight: FontWeight.w900,
              ),
              labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.04,
          ),
          body: Container(
            color: Colors.white,
            child: TabBarView(
              children: GlobalConstants.tabs.map((Tab tab) {
                if (tab.text == "Acerca de") {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: acercaDerPokemon(context, pokemon),
                  );
                }
                if (tab.text == "Estado base") {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: estadoBasePokemon(context, pokemon),
                  );
                }
                if (tab.text == "Peliculas") {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: moviesPokemon(context, pokemon),
                  );
                }
                return Container(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1),
                      child: const Text("No hay información disponible"),
                    ),
                  ]),
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }

  Column acercaDerPokemon(BuildContext context, PokemonModel pokemon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                "Especie",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Text(
              "${pokemon.species!.name}",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                "Alto",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Text(
              "0.${pokemon.height} CM",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                "Peso",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Text(
              "${pokemon.weight!} KG",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                "Habilidades",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Row(
              children: List.generate(
                pokemon.abilities!.length,
                (index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 5, top: 5, right: 10),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 0, right: 10, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(100, 255, 250, 250),
                      ),
                      child: Text(
                        "${pokemon.abilities![index].ability!.name}"
                                .substring(0, 1)
                                .toUpperCase() +
                            "${pokemon.abilities![index].ability!.name}"
                                .substring(1),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text(
          "Cría",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                "Grupo de huevos",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Text(
              pokemon.eggPokemonModel == null
                  ? ""
                  : pokemon.eggPokemonModel!.name,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    );
  }

  Column estadoBasePokemon(BuildContext context, PokemonModel pokemon) {
    return Column(
      children: [
        Column(
          children: List.generate(
            pokemon.stats!.length,
            (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      pokemon.stats![index].stat!.name!,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.height * 0.005,
                    child: LinearProgressIndicator(
                      value: (pokemon.stats![index].baseStat!) / 100,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
  }

  SingleChildScrollView moviesPokemon(
      BuildContext context, PokemonModel pokemon) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(pokemon.moves!.length, (index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.movie,
                color: Colors.black54,
                size: MediaQuery.of(context).size.width * 0.05,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  "Nombre de pelicula",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                child: Text(
                  pokemon.moves![index].move!.name!,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
