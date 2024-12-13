// La classe `CryptoDetailsPage` mostra una pàgina amb els detalls d'una criptomoneda. Rep un objecte `Crypto` com a paràmetre i visualitza informació com el nom, símbol, imatge i altres dades financeres, com el preu actual. Utilitza un `AppBar` i un `SingleChildScrollView` per a una millor experiència d'usuari.

import 'package:apipmm/providers/crypto_provider.dart';
import 'package:apipmm/rutes/rutes.dart';
import 'package:apipmm/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/crypto.dart';

class CryptoDetailsPage extends StatelessWidget {
  final Crypto crypto;

  const CryptoDetailsPage({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CryptoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(crypto.name),
        centerTitle: true,
        backgroundColor: const Color(0xFF00C4B4),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF181A20),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              // Imatge de la criptomoneda
              Center(
                child: Image.network(
                  crypto.image,
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 40),
              // Nom i simbol
              Center(
                child: Text(
                  '${crypto.symbol.toUpperCase()}',
                  style: const TextStyle(
                    color: Color(0xFF00C4B4),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Preu actual
              dades_crypto_pageDetail(crypto: crypto),
              const SizedBox(height: 30),

              CryptoSlider(cryptos: provider.popularMemecoins),
              const SizedBox(height: 50),

              Center(
                  child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Rutes.perfil);
                },
                child: const Text(
                  'Creat per Raül Lama ..🚀',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF181A20),
    );
  }
}
