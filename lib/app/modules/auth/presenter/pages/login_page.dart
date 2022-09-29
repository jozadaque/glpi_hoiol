import 'package:flutter/material.dart';

import 'widgets/waves/wave_widget.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    TextFieldWidget(labelText: 'Senha'),
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

class ButtonWidget extends StatelessWidget {
  final String label;

  const ButtonWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: const ButtonStyle(),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String labelText;

  const TextFieldWidget({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color.fromARGB(251, 7, 22, 235),
            )),
      ),
    );
  }
}
