import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldflutterstocks/widgets/crypto_list.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CryptoMock extends StatefulWidget {
  @override
  _CryptoMockState createState() => _CryptoMockState();
}

class _CryptoMockState extends State<CryptoMock> {

//  final String url ="https://my.api.mockaroo.com/crypto_data.json?key=cbcf98d0";
//  final String url ="https://pro-api.coinmarketcap.com/v1/cryptocurrency/ohlcv/latest";
  final String url ="https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&&CMC_PRO_API_KEY=da830478-cb3a-4e1b-828b-63432e3a5319";

  List crypto_data;


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
    print(response.body);

    ///if response modify state of our widget
    setState(() {
      var convertDataToJson = json.decode(response.body);
      crypto_data = convertDataToJson['data'];
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
        itemCount: crypto_data == null ? 0 : crypto_data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(crypto_data[index]['name']),
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
