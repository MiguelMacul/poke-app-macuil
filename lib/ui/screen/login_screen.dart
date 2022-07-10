import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeappmacuil/bloc/user/user_bloc.dart';
import 'package:pokeappmacuil/ui/widgets/form_register_user.dart';
import 'package:pokeappmacuil/ui/widgets/message_welcome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context, listen: false).add(ActualizarUsuario());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  if (state.existe) {
                    return const MessageWelcome();
                  } else {
                    return FormRegisterUser();
                  }
                })
              ],
            );
          },
        ),
      ),
    );
  }
}
