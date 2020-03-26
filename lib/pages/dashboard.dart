import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// THIS IS WHERE I CREATE MY DASHBOARD TILES

class DashboardPage extends StatefulWidget {
  DashboardPage();
  var myItem1;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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

//      appBar: AppBar(
//        title: Text(
//          "Dashboard",
//          style: TextStyle(color: Colors.white),
//        ),
//
////        ],
//      ),

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
          myItems(Icons.book, "Porfolio", 0xff622F74),
          myItems(Icons.settings, "Settings", 0xffad61f1),
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
