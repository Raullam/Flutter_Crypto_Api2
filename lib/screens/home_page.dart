// La classe HomePage és la pantalla inicial de l'aplicació. Utilitza el proveïdor CryptoProvider per obtenir la llista de criptomonedes i mostrar-la. Inclou un AppBar amb un títol i un botó de cerca que obre un cercador personalitzat. Quan les dades estan carregant, es mostra un indicador de càrrega, i quan s'ha carregat, es mostra el contingut mitjançant el mètode logicaHome.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/crypto_provider.dart';
import 'package:apipmm/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CryptoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BlockChain Mallorca',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF00C4B4),
        actions: [
          // icona de busqueda
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CryptoSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: logicaHome(provider: provider),
            ),
      backgroundColor: const Color(0xFF181A20),
    );
  }
}
