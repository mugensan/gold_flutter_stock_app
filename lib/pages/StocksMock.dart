import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldflutterstocks/widgets/crypto_list.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class StocksMock extends StatefulWidget {
  @override
  _StocksMockState createState() => _StocksMockState();
}

class _StocksMockState extends State<StocksMock> {

  final String url ="https://my.api.mockaroo.com/stocks_data.json?key=cbcf98d0";

  List stock_data;


  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(
      ///encoding url
        Uri.encodeFull(url),
        ///only accept json response
        headers: {"Accept":"application/json"}
    );

    ///test: this line will not be executed until we get a response
//    print(response.body);

    ///if response modify state of our widget
    setState(() {
      var convertDataToJson = json.decode(response.body);
      stock_data = convertDataToJson;
      ///need to extract data
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve JSON via HTTP Get"),
      ),
      body: new ListView.builder(
        itemCount: stock_data == null ? 0 : stock_data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(stock_data[index]['symbol']),
                      padding: const EdgeInsets.all(20.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
