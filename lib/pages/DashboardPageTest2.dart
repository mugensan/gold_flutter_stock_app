import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// THIS IS WHERE I CREATE MY DASHBOARD TILES

class DashboardPageTest2 extends StatefulWidget {
  DashboardPageTest2();

  var myItem1;

  @override
  _DashboardPageTest2State createState() => _DashboardPageTest2State();
}

class _DashboardPageTest2State extends State<DashboardPageTest2> {
  ///creating my items and tile conf
  Material myItems(IconData icon, String heading, int color) {
//    onTap:(){
//
//      Navigator.pushNamed(context, "/crypto_page");
//      print("TAPPED");
//
//    };
//    BackgColor.fromRGBO(59, 89, 152, 1.0);
    return new Material(
      color: Color.fromRGBO(59, 89, 152, 0.85),
//      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),

      ///inside tiles elements

      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ///Text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: new Color(color),
                        fontSize: 20.0,
                      ),
                    ),
                  ),

                  ///Icons
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashboardPageTest2"),

        ///this target transition between android and IOS
        elevation: debugDefaultTargetPlatformOverride == TargetPlatform.android
            ? 5.0
            : 0.0,
      ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[

              new UserAccountsDrawerHeader(
                accountName: new Text("Kevin Roditi"),
                accountEmail: new Text("kevin@gmail.com"),
                currentAccountPicture: ClipOval(
                  child: Image.asset(
                    "assets/mugenThinker.png",
                    fit: BoxFit.contain,
                  ),
                ),
                otherAccountsPictures: <Widget>[
                  new ClipOval(
                    child: Image.asset(
                      "assets/mugenThinker.png",
                      fit: BoxFit.contain,
//                child: new Text("K"),
                    ),
                  ),
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
                onTap: () {
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




      ///creating the grid tiles

      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),

        ///tile definition
        children: <Widget>[
//          onPressed:(){
//            myItems(Icons.graphic_eq, "Graphic_eq", 0xffed622d);
//            Navigator.of(context).pushNamed("/crypto_page");
//
//          }
          ///creating a function for each tile

//          myItems(Icons.graphic_eq, "Graphic_eq", 0xffed622d),
//      onTap: () {
//        Navigator.of(context).pushNamed("/crypto_page");
//      },

          myItems(Icons.account_balance, "Balance", 0xff26cb3c),
          myItems(Icons.attach_money, "CryptoCurrency", 0xffff3266),
          myItems(Icons.graphic_eq, "Stocks", 0xff3399fe),
          myItems(Icons.settings, "Settings", 0xff622F74),
          myItems(Icons.message, "Gold Book", 0xffad61f1),
        ],

        staggeredTiles: [
          ///graphic_eq tile
          const StaggeredTile.extent(2, 130.0),

          ///bookmark+notification
          StaggeredTile.extent(1, 130.0),

          ///balance +settings
          StaggeredTile.extent(1, 130.0),

          ///group work
          StaggeredTile.extent(2, 130.0),

          ///messages
          StaggeredTile.extent(2, 130.0),
        ],
      ),
    );
  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

//  final String heading;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/crypto_page");
        },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _Example02Tile extends StatelessWidget {
  const _Example02Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/stock_page");
        },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
