import 'package:flutter/material.dart';
import 'package:goldflutterstocks/pages/dashboard.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      home: Dashboard(),
    );

  }
}
