import 'package:flutter/material.dart';
import 'package:pokeappmacuil/model/equipo_model.dart';

class ItemCardTeam extends StatelessWidget {
  EquipoModel equipo;
  ItemCardTeam({required this.equipo, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.01,
        ),
        Container(
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
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          child: Icon(
            Icons.people,
            color: Colors.black,
            size: MediaQuery.of(context).size.width * 0.1,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.02,
        ),
        Container(
          color: Colors.white,
          child: Text(
            equipo.nombreEquipo.toString(),
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
