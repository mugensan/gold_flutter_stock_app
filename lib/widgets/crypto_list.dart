import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldflutterstocks/models/stock.dart';

class StockList extends StatelessWidget {

  final List<Stock>stocks;

  //  StockList structure
  StockList({this.stocks});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.white);
        },
        itemCount: stocks.length,
        itemBuilder: (context, index) {

          final stock = stocks[index];

          return ListTile(
            contentPadding: EdgeInsets.all(10),
            //this is the column for the symbol and company name
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${stock.symbol}",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight:FontWeight.w500 ),),
                Text("${stock.company}",style: TextStyle(color: Colors.white,fontSize: 14 ),)
              ],),

            //this coloumn is for the price and the change%
            trailing: Column(
              children: <Widget>[
                Text("${stock.price}",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight:FontWeight.w500 ),),
                Container(
                  width: 75,
                  height: 25,
                  //hardcoding the value for now
                  child: Text("-1.09",style: TextStyle(color: Colors.white),),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red
                  ),
                )

              ],
            ),
          );
          //for test purpose
//          return Text("Stocks", style: TextStyle(color: Colors.white));
        }
    );
  }
}
