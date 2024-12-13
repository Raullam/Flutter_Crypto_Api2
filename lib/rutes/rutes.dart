// Aquesta classe `Rutes` gestiona les rutes i la navegació dins de l'aplicació. Té constants per a les rutes principals (`home` i `perfil`) i un mètode estàtic `obtenerRutas` que retorna un mapa de les rutes i els seus constructors associats. A més, inclou un mètode de navegació dinàmica, `paginaDetall`, que permet navegar a la pàgina de detalls de la criptomoneda (`CryptoDetailsPage`) passant un objecte `Crypto` com a paràmetre.

import 'package:apipmm/models/crypto.dart';
import 'package:apipmm/screens/crypto_detail_page.dart';
import 'package:apipmm/screens/home_page.dart';
import 'package:apipmm/screens/pagina_perfil.dart';
import 'package:flutter/material.dart';

class Rutes {
  static const String home = '/';
  static const String perfil = '/desenvolupador';

  static Map<String, WidgetBuilder> obtenerRutas() {
    return {
      home: (BuildContext context) => HomePage(),
      perfil: (BuildContext context) => const PaginaPerfil(),
    };
  }

  // Navegació dinamica per a CryptoDetailsPage
  static paginaDetall(BuildContext context, {required Crypto crypto}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CryptoDetailsPage(crypto: crypto),
      ),
    );
  }
}
