import 'package:flutter/material.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/login_bloc/login_bloc.dart';

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

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
                  children: const [
                    TextFieldWidget(labelText: 'Usuário'),
                    SizedBox(height: 10),
                    TextFieldWidget(labelText: 'Senha', obscuredText: true),
                    SizedBox(height: 10),
                    ButtonWidget(label: 'Logar'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
