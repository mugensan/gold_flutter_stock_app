import 'package:flutter/material.dart';
import 'package:goldflutterstocks/pages/StocksPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:"Stocks",
      home: HomePage(),
//      stock:StockPage(),
//      crypto:CryptoPage(),
    );
  }
}
