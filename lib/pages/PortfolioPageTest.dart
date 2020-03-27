import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goldflutterstocks/pages/GraphPage.dart';
import 'package:http/http.dart' as http;

import 'CryptoMock.dart';
import 'StocksMock.dart';
import 'dashboard.dart';
import 'main.dart';

class PortfolioPageTest extends StatefulWidget {


  @override
  _PortfolioPageTestState createState() => _PortfolioPageTestState();
}

class _PortfolioPageTestState extends State<PortfolioPageTest> {


  final String url ="https://my.api.mockaroo.com/sharpe_ration_data.json?key=cbcf98d0";

  List stocks_data;


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
      stocks_data = convertDataToJson;
      ///need to extract data
    });

    return "Success!";
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: <Widget>[
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ), Tab(
                  icon: Icon(FontAwesomeIcons.chartPie),
                ), Tab(
                  icon: Icon(FontAwesomeIcons.chartLine),
                ),

              ],
            ),
            title: Text('My Stocks Charts'),
          ),
          body: TabBarView(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }


}
