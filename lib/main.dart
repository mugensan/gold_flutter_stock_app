import 'package:flutter/material.dart';
import 'package:goldflutterstocks/widgets/HomePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:"Stocks",
      home: HomePage()
    );
  }
}
