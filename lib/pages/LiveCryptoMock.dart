//import 'dart:async';
//import 'dart:convert';
//import 'dart:ffi';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//class LiveCryptoMock extends StatefulWidget {
//  @override
//  _LiveCryptoMockState createState() => _LiveCryptoMockState();
//}
//
//class _LiveCryptoMockState extends State<LiveCryptoMock> {
//  final String url_pro =
//      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=100&&CMC_PRO_API_KEY=da830478-cb3a-4e1b-828b-63432e3a5319";
//  final String url_mock =
//      "https://my.api.mockaroo.com/crypto_data.json?key=cbcf98d0";
//
//  List crypto_data_pro;
//  List crypto_data_mock;
//
//  final List<MaterialColor> _colors = [Colors.blue, Colors.amber, Colors.red];
//
//  @override
//  void initState() {
//    super.initState();
//    this.getJsonDataMock();
//    this.getJsonDataPro();
//  }
//
//  Future<String> getJsonDataMock() async {
//    var response = await http.get(
//
//        ///encoding url
//        Uri.encodeFull(url_mock),
////        var url_mock = Uri.encodeFull(url_pro),
//
//        ///only accept json response
//        headers: {"Accept": "application/json"});
//
//    ///test: this line will not be executed until we get a response
////    print(response.body);
//
//    ///if response modify state of our widget
//    setState(() {
//      var convertDataToJson = json.decode(response.body);
//      crypto_data_pro = convertDataToJson;
//
//      ///need to extract data
//    });
//
//    return "Success!";
//  }
//
//  Future<String> getJsonDataPro() async {
//    var response = await http.get(
//
//        ///encoding url
//        Uri.encodeFull(url_pro),
////        var url_mock = Uri.encodeFull(url_pro),
//
//        ///only accept json response
//        headers: {"Accept": "application/json"});
//
//    ///test: this line will not be executed until we get a response
////    print(response.body);
//
//    ///if response modify state of our widget
//    setState(() {
//      var convertDataToJson = json.decode(response.body);
//      crypto_data_pro = convertDataToJson['data'];
//
//      ///need to extract data
//    });
//
//    return "Success!";
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("CryptoCurrencies"),
//      ),
//
//      body: LiveCryptoPro(),
//
//      new ListView.builder(
//        itemCount: crypto_data == null ? 0 : crypto_data.length,
//        itemBuilder: (BuildContext context, int index) {
//          return new Container(
//            child: new Center(
//              child: new Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: <Widget>[
//                  new Card(
//                    child: new Container(
//                      child: new Text(crypto_data[index]['name']),
//                      padding: const EdgeInsets.all(20.0),
//                    ),
//                  )
//                ],
//              ),
//            ),
//          );
//        },
//    );
//  }
//
//  Widget _cryptoWidgetPro() {
//    return new Container(
//      child: new Flexible(
//        child: new ListView.builder(
//          itemCount: crypto_data_pro == null ? 0 : crypto_data_pro.length,
//          itemBuilder: (BuildContext context, int index) {
//            final Map currency_pro = crypto_data_pro[index];
//            final Map currency_mock = crypto_data_mock[index]['price'];
//
//            final MaterialColor color = _colors[index % _colors.length];
//
//            ///Building UI
//            return _getListItemUI_pro(currency_pro, color);
////
//          },
//        ),
//      ),
//    );
//  }Widget _cryptoWidgetMock() {
//    return new Container(
//      child: new Flexible(
//        child: new ListView.builder(
//          itemCount: crypto_data_mock == null ? 0 : crypto_data_mock.length,
//          itemBuilder: (BuildContext context, int index) {
//            final Map currency_mock = crypto_data_mock[index];
//
//            final MaterialColor color = _colors[index % _colors.length];
//
//            ///Building UI
//            return _getListItemUI_mock(currency_mock, color);
//          },
//        ),
//      ),
//    );
//  }
//
//  ListTile _getListItemUI_pro(Map currency_pro, MaterialColor color) {
//    return new ListTile(
//      leading: new CircleAvatar(
//        backgroundColor: color,
//        child: new Text(currency_pro['name'][0]),
//      ),
//      title: new Text(
//        currency_pro['name'],
//        style: new TextStyle(fontWeight: FontWeight.bold),
//      ),
//      subtitle: _getSubtitleText(
//          currency_pro['price'], currency_pro['percent_change_1h']),
//      isThreeLine: true,
//    );
//  }
//
//  ListTile _getListItemUI_mock(Map currency_mock, MaterialColor color) {
//    return new ListTile(
//      leading: new CircleAvatar(
//        backgroundColor: color,
//        child: new Text(currency_mock['price'][0]),
//      ),
//      title: new Text(
//        currency_mock['name'],
//        style: new TextStyle(fontWeight: FontWeight.bold),
//      ),
//      subtitle: _getSubtitleText(
//          currency_mock['price'], currency_mock['percent_change_1h']),
//      isThreeLine: true,
//    );
//  }
//
//  Widget _getSubtitleText(Double price, String percent_change_1h) {
//    TextSpan priceTextWidget = new TextSpan(
//        text: "\$$percent_change_1h\n",
//        style: new TextStyle(color: Colors.black));
//    String percentageChangeText = "1 hour: $percent_change_1h";
//    TextSpan percentageChangeTextWidget;
//    if (double.parse(percent_change_1h) > 0) {
//      percentageChangeTextWidget = new TextSpan(
//          text: percentageChangeText,
//          style: new TextStyle(color: Colors.green));
//    } else {
//      percentageChangeTextWidget = new TextSpan(
//          text: percentageChangeText, style: new TextStyle(color: Colors.red));
//    }
//    return new RichText(
//      text:
//          new TextSpan(children: [priceTextWidget, percentageChangeTextWidget]),
//    );
//  }
//}
