import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/login_bloc/login_bloc.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/login_bloc/login_state.dart';

import '../../domain/types/params.dart';
import '../ui/bloc/auth_state.dart';
import '../ui/bloc/login_bloc/login_event.dart';
import 'widgets/button_widget.dart';
import 'widgets/textfield_widget.dart';
import 'widgets/waves/wave_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc bloc;

  late TextEditingController user;
  late TextEditingController password;

  @override
  void dispose() {
    bloc.close();
    user.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    bloc = Modular.get<LoginBloc>();
    user = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  showSnackBar(String message) {
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final keybordIsActive = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 11, 235),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutQuad,
            top: keybordIsActive ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: const Color.fromARGB(255, 254, 255, 255),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Center(
                child: Text(
                  'GLPI',
                  style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 11, 11, 235)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 60, left: 20, right: 20, bottom: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextFieldWidget(labelText: 'Usuário', controller: user),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      labelText: 'Senha',
                      obscuredText: true,
                      controller: password,
                    ),
                    const SizedBox(height: 10),
                    ButtonWidget(
                        label: 'Logar',
                        onPressed: () {
                          bloc.add(LoginEvent(Params(
                            password: password.text,
                            user: user.text,
                          )));
                        }),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<LoginBloc, AuthState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is InitialLoginState) {
                  return Container();
                }
                if (state is LoadingLoginState) {
                  return Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: const Center(child: CircularProgressIndicator()));
                }
                if (state is ExceptionLoginState) {
                  return Container(
                    child: showSnackBar(state.exception.message),
                  );
                }
                if (state is SuccessLoginState) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  Modular.to.pushReplacementNamed('/tickets/');
                }
                return Container();
              }),
        ],
      ),
    );
  }
}
