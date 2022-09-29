import 'package:flutter/material.dart';

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
