import 'package:flutter/material.dart';
import 'package:goldflutterstocks/pages/StocksPage.dart';
import 'package:goldflutterstocks/pages/dashboard.dart';

void main() => runApp(App());

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:"Dashboard",
      home: Dashboard(

      ),
//      stock:StockPage(),
//      crypto:CryptoPage(),
    );
  }
}
