// El widget `dadesPaginaPerfil` mostra informació personal a la pàgina de perfil. Inclou un Container estilitzat amb el text "Hello I'm", seguit de informació com (Raül Lama), (Fullstack Developer).

import 'package:flutter/material.dart';

class dadesPaginaPerfil extends StatelessWidget {
  const dadesPaginaPerfil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        // Boto "Hello I'm"
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF00C4B4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Hello I'm",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(
            'Raül Lama',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Fullstack Developer',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
