import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeappmacuil/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokeappmacuil/bloc/team/team_pokemon_bloc.dart';
import 'package:pokeappmacuil/bloc/user/user_bloc.dart';
import 'package:pokeappmacuil/ui/screen/detail_pokemon_screen.dart';
import 'package:pokeappmacuil/ui/screen/detail_team_screen.dart';
import 'package:pokeappmacuil/ui/screen/home_screen.dart';
import 'package:pokeappmacuil/ui/screen/login_screen.dart';
import 'package:pokeappmacuil/ui/screen/team_pokemon_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
          create: (_) => PokemonBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (_) => UserBloc(),
        ),
        BlocProvider<TeamPokemonBloc>(
          create: (_) => TeamPokemonBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Poke App',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const LoginScreen(),
          "/home": (context) => const HomeScreen(),
          "/detail_pokemon": (context) => const DetailPokemon(),
          "/team_pokemon": (context) => const TeamPokemonScreen(),
          "/detail_team": (context) => const DetailTeamScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
