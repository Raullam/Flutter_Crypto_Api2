import 'package:apipmm/rutes/rutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apipmm/providers/crypto_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CryptoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BlockChain Mallorca',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: Rutes.home,
        routes: Rutes.obtenerRutas(),
      ),
    );
  }
}
