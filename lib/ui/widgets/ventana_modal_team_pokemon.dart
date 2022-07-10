import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeappmacuil/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokeappmacuil/bloc/team/team_pokemon_bloc.dart';

class VentanaModalTeamPokemon extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerUsuario = TextEditingController();
  VentanaModalTeamPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: const Text(
        "Equipo de Pokemon",
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: _formKey,
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: _controllerUsuario,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9 ]')),
          ],
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Ingrese un nombre del equipo';
            }
            return null;
          },
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              child: ElevatedButton.icon(
                onPressed: () {
                  BlocProvider.of<PokemonBloc>(context)
                      .add(InicializarPokemonEvent());
                  BlocProvider.of<TeamPokemonBloc>(context)
                      .add(FinalizarProcesoCrearTeam(
                    esActivoFinalizarTeam: false,
                    nombreEquipo: _controllerUsuario.value.text,
                    pokemon: BlocProvider.of<TeamPokemonBloc>(context)
                        .state
                        .pokemons!,
                  ));

                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                label: const Text("Aceptar"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 24, 187, 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                ),
                label: const Text("Cancelar"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 224, 4, 51),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
