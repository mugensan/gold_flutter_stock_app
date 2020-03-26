import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldflutterstocks/pages/dashboard.dart';
import 'package:goldflutterstocks/pages/main.dart';
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
  final String url_pro ="https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=100&&CMC_PRO_API_KEY=da830478-cb3a-4e1b-828b-63432e3a5319";
  final String url_mock = "https://my.api.mockaroo.com/crypto_data.json?key=cbcf98d0";

  List crypto_data_mock;
  List crypto_data_pro;


  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response_mock = await http.get(

      ///encoding url
        Uri.encodeFull(url_mock),

        ///only accept json response
        headers: {"Accept": "application/json"}
    );var response_pro = await http.get(

      ///encoding url
        Uri.encodeFull(url_pro),

        ///only accept json response
        headers: {"Accept": "application/json"}
    );

    ///test: this line will not be executed until we get a response
    print(response_pro.body);

    ///if response modify state of our widget
    setState(() {
      var convertDataToJsonMock = json.decode(response_mock.body);
      crypto_data_mock = convertDataToJsonMock;
      var convertDataToJsonPro = json.decode(response_pro.body);
      crypto_data_pro = convertDataToJsonPro['data'];

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
        itemCount: crypto_data_mock == null ? 0 : crypto_data_mock.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new ListTile(

              onTap: (){
                Navigator.of(context).pushNamed("/dashboard");
              },


              title: new Text(crypto_data_pro[index]['name'] as String,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),


              ),
              subtitle: Text(crypto_data_mock[index]['price']),
              trailing: Text(crypto_data_mock[index]['market_cap']),
//              subtitle: _getSubtitleText(crypto_data[index]['price'], crypto_data[index]['percent_change_1h']),

//              new Text(crypto_data[index]['percent_change_1h'],
//                style: TextStyle(
//                    fontSize: 12
//                ),
//              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getSubtitleText(String price, String percent_change_1h) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$percent_change_1h\n",
        style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percent_change_1h";
    TextSpan percentageChangeTextWidget;
    if (double.parse(price) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }
    return new RichText(
      text:
      new TextSpan(children: [priceTextWidget, percentageChangeTextWidget]),
    );
  }
}

//
