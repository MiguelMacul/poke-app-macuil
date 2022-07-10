import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeappmacuil/bloc/user/user_bloc.dart';

class MessageWelcome extends StatelessWidget {
  const MessageWelcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.09,
        left: MediaQuery.of(context).size.width * 0.09,
        top: MediaQuery.of(context).size.height * 0.15,
      ),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              "Bienvenido entrenad@r ${BlocProvider.of<UserBloc>(context).state.user?.usuario}\n a tu pokedex",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.5),
                child: Image.asset(
                  "assets/img/enfermera-joy.png",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Image.asset(
                    "assets/img/logo-pokemon-botton.png",
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
