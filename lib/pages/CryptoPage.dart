import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldflutterstocks/models/stock.dart';
import 'package:goldflutterstocks/widgets/stock_list.dart';

class CryptoPage extends StatelessWidget {

  CryptoPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cryptocurrency"),
      ),

      body: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(59, 89, 152, 1.0),
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //this is my title
                  Text("Cryptos",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  //this is my date
                  Text(
                    "March 23",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SizedBox(
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            hintText: "Search",
                            prefix: Icon(Icons.search),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height - 310,
                      child: StockList(
                        stocks: Stock.getAll(),
                      )),
                ]),
          ),
        )
      ]),
    );
  }
}
