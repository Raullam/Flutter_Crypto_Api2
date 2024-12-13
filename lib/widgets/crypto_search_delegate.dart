// La classe `CryptoSearchDelegate` implementa la funcionalitat de cerca dins de l'aplicació, permetent als usuaris cercar criptomonedes pel seu nom. Mostra els resultats a mesura que es va escrivint, amb informació de cada criptomoneda com la seva imatge, preu i variació en les últimes 24 hores. En seleccionar una criptomoneda, es navega a la pàgina de detalls corresponent.

import 'package:apipmm/rutes/rutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/crypto_provider.dart';
import '../models/crypto.dart';
import '../screens/crypto_detail_page.dart';

class CryptoSearchDelegate extends SearchDelegate<Crypto?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // si hi ha texta al buscador el buida
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context,
            null); //Tanca el buscador, podriem haver fet un pop pero utilitzem close
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final provider = Provider.of<CryptoProvider>(context, listen: false);
    final filteredCryptos = provider.cryptos
        .where(
            (crypto) => crypto.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      body: ListView.builder(
        itemCount: filteredCryptos.length,
        itemBuilder: (context, index) {
          final crypto = filteredCryptos[index];
          return ListTile(
            leading: Image.network(
              crypto.image,
              width: 40,
              height: 40,
            ),
            title: Text(
              crypto.name,
              style: const TextStyle(
                color: Color(0xFF00C4B4),
              ),
            ),
            subtitle: Text(
              '\$${crypto.currentPrice}',
              style: const TextStyle(
                color: Color(0xFF00C4B4),
              ),
            ),
            trailing: Text(
              '${crypto.priceChangePercentage24h}%',
              style: TextStyle(
                color: crypto.priceChangePercentage24h > 0
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            //si pitjem algun element de la llista ens dirigim a CryptoDetailsPage
            onTap: () {
              Rutes.paginaDetall(context, crypto: crypto);
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = Provider.of<CryptoProvider>(context, listen: false);
    final filteredCryptos = provider.cryptos
        .where(
            (crypto) => crypto.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      body: ListView.builder(
        itemCount: filteredCryptos.length,
        itemBuilder: (context, index) {
          final crypto = filteredCryptos[index];
          return ListTile(
            leading: Image.network(
              crypto.image,
              width: 40,
              height: 40,
            ),
            title: Text(
              crypto.name,
              style: const TextStyle(
                color: Color(0xFF00C4B4),
              ),
            ),
            subtitle: Text(
              '\$${crypto.currentPrice}',
              style: const TextStyle(
                color: Color(0xFF00C4B4),
              ),
            ),
            trailing: Text(
              '${crypto.priceChangePercentage24h}%',
              style: TextStyle(
                color: crypto.priceChangePercentage24h > 0
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Navegar a la pàgina de detalls de les criptomonedes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CryptoDetailsPage(crypto: crypto),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  String get searchFieldLabel =>
      'Buscar una criptomoneda'; // Personalitzar el camp de busqueda
}
