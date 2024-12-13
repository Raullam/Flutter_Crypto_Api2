// La classe `PaginaPerfil` mostra informació sobre mi. Té una imatge de perfil central, seguida d'informació personal (mitjançant el widget `dadesPaginaPerfil`). A més, hi ha una fila amb icones d'enllaços a xarxes socials com YouTube, GitHub, LinkedIn i Facebook. Quan es fa clic a qualsevol de les icones, s'obre l'enllaç corresponent mitjançant la funció `_launchURL`.

import 'package:apipmm/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaginaPerfil extends StatelessWidget {
  const PaginaPerfil({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    try {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        print('No es pot obrir la URL');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desenvolupador'),
        centerTitle: true,
        backgroundColor: Color(0xFF00C4B4),
      ),
      backgroundColor: const Color(0xFF181A20),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imatge de perfil
                const Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: CircleAvatar(
                    radius: 140,
                    backgroundImage: NetworkImage(
                      'https://raullam.github.io/miWeb/assets/images/heri.jpg',
                    ),
                  ),
                ),
                const dadesPaginaPerfil(), // informació meva (pàgina perfil)
                // Xarxes socials
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        _launchURL('https://www.youtube.com/');
                      },
                      icon: const FaIcon(FontAwesomeIcons.youtube),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        _launchURL('https://github.com/');
                      },
                      icon: const FaIcon(FontAwesomeIcons.github),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        _launchURL('https://www.linkedin.com/');
                      },
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        _launchURL('https://dev.to/');
                      },
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
