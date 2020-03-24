import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:goldflutterstocks/pages/CryptoPage.dart';
import 'package:goldflutterstocks/pages/StocksPage.dart';
import 'package:goldflutterstocks/pages/dashboard.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/crypto_page": (BuildContext context) => new CryptoPage(),
        "/stock_page": (BuildContext context) => new StocksPage(),
        "/dashboard": (BuildContext context) => new DashboardPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("HomePage to Dashboard"),

        ///this target transition between android and IOS
        elevation: debugDefaultTargetPlatformOverride == TargetPlatform.android
            ? 5.0
            : 0.0,
      ),

      ///creating the drawer for the homepage/dashboard
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Kevin Roditi"),
              accountEmail: new Text("kevin@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("K"),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
//                  backgroundColor: Colors.white,
//                  child: Ink.image("assets/mugenThinker.png" )
                  child: Text("K"),
                )
              ],
            ),
            new ListTile(
              title: new Text("Dashboard"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pushNamed("/dashboard");
                Navigator.of(context).pop();
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("CryptoPage"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/crypto_page");

              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("StockPage"),
              trailing: new Icon(Icons.arrow_forward),
              onTap:() {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/stock_page");

              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Portfolio"),
              trailing: new Icon(Icons.arrow_forward),
              ///TODO ADD ROUTE
            ),
            new Divider(),
            new ListTile(
              title: new Text("About"),
              trailing: new Icon(Icons.arrow_forward),
              ///TODO ADD ROUTE
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close Menu"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),

      body: new Container(
        child: new Center(child: DashboardPage()
//          child: new Text("this is where the dashboard will go"),
            ),
      ),
    );
  }
}
