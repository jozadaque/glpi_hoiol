import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final bool obscuredText;

  const TextFieldWidget({
    super.key,
    required this.labelText,
    this.obscuredText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscuredText,
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
