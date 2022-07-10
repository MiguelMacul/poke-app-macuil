import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeappmacuil/bloc/user/user_bloc.dart';
import 'package:pokeappmacuil/model/user_model.dart';

class FormRegisterUser extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerUsuario = TextEditingController();
  FormRegisterUser({Key? key}) : super(key: key);

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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Bienvenido entrenad@r a tu pokedex",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.065,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
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
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.03),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _controllerUsuario,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9 ]')),
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese tu nombre';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                autofocus: true,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 40),
                  elevation: 0.0,
                  primary: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                child: Container(
                  child: const Text("Registrar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<UserBloc>(context).add(
                      AgregarUsuario(
                        user: UserModel(
                          id: null,
                          usuario: _controllerUsuario.value.text,
                        ),
                      ),
                    );
                    Navigator.pushNamed(context, '/home');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
