import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioPageTest extends StatefulWidget {
  @override
  _PortfolioPageTestState createState() => _PortfolioPageTestState();
}

class _PortfolioPageTestState extends State<PortfolioPageTest> {
  ///GENERATING DATA FOR TASK DETAIL
  ///Series

  List<charts.Series<MACD, double>> _seriesSharpeData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Polution, String>> _seriesPolutionData;
  List<charts.Series<LinearPoints,int>> _seriesLinearData;

  _generateData() {

    var linear1 = [
      new LinearPoints(0,0),
      new LinearPoints(1,5),
      new LinearPoints(2,12),
      new LinearPoints(3,3),
      new LinearPoints(4,3),
      new LinearPoints(5,6),
      new LinearPoints(6,7),
      new LinearPoints(7,1),
      new LinearPoints(8,7),
    ];

    ///THIS WILL BE THE STRATEGY GRAPH + SHARPE RATIO
    var macd1 = [
      new MACD(222, 433.3, 400.0, 455.9, 400.0),
      new MACD(22, 43.3, 40.0, 45.9, 40.0),
      new MACD(2, 3.3, 4.0, 4.9, 4.0),
    ];
//    var macd2 = [
//      new MACD('January', 222, 433.3, 400.0, 455.9, 400.0),
//      new MACD('Feb', 22, 43.3, 40.0, 45.9, 40.0),
//      new MACD('March', 2, 3.3, 4.0, 4.9, 4.0),
//    ];
//    var macd3 = [
//      new MACD('April', 222, 433.3, 400.0, 455.9, 400.0),
//      new MACD('May', 22, 43.3, 40.0, 45.9, 40.0),
//      new MACD('June', 2, 3.3, 4.0, 4.9, 4.0),
//    ];

    ///SPIKE CHART
    var data1 = [
      new Polution('AAPL', 222, 433.3, 400.0, 455.9, 400.0, 433.3),
      new Polution('MSCT', 22, 43.3, 40.0, 45.9, 40.0, 43.3),
      new Polution('IBM', 2, 3.3, 4.0, 4.9, 4.0, 4.3),
    ];
    var data2 = [
      new Polution('AAPL', 222, 433.3, 400.0, 455.9, 400.0, 433.3),
      new Polution('MSCT', 22, 43.3, 40.0, 45.9, 40.0, 43.3),
      new Polution('IBM', 2, 3.3, 4.0, 4.9, 4.0, 4.3),
    ];
    var data3 = [
      new Polution('AAPL', 222, 433.3, 400.0, 455.9, 400.0, 433.3),
      new Polution('MSCT', 22, 43.3, 40.0, 45.9, 40.0, 43.3),
      new Polution('IBM', 2, 3.3, 4.0, 4.9, 4.0, 4.3),
    ];

    ///PIE CHART
    var pieData = [
      new Task('Stock_amount', 300, Color(0xff3366cc)),
      new Task('Price', 266, Colors.purple),
      new Task('Amount', 123, Colors.orange),
//      new Task('Open', 300, Colors.black),
//      new Task('High', 300, Colors.orange),
//      new Task('Low', 300, Colors.cyan),
//      new Task('Close', 300, Colors.red),
    ];

    ///this where you add your details to the PIE graph
    _seriesPieData.add(
      charts.Series(
        data: pieData,

        ///adding X & Y axis
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskValues,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorValues),
        id: 'My stocks',
        labelAccessorFn: (Task row, _) => '${row.taskValues}',
      ),
    );

    ///this is where you add your details for the polution graph
    _seriesPolutionData.add(
      charts.Series(
        ///defining the first serie (1 color bar)
        domainFn: (Polution polution, _) => polution.stock_name,
        measureFn: (Polution polution, _) => polution.stock_quantity,
        id: 'MARKETCAP',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Polution polution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesPolutionData.add(
      charts.Series(
        ///defining the first serie (1 color bar)
        domainFn: (Polution polution, _) => polution.stock_name,
        measureFn: (Polution polution, _) => polution.stock_quantity,
        id: 'MARKETCAP',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Polution polution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesPolutionData.add(
      charts.Series(
        ///defining the first serie (1 color bar)
        domainFn: (Polution polution, _) => polution.stock_name,
        measureFn: (Polution polution, _) => polution.stock_quantity,
        id: 'MARKETCAP',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Polution polution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesSharpeData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: "APPLE",
        data: macd1,
        domainFn: (MACD macd, _) => macd.open,
        measureFn: (MACD macd, _) => macd.price,
      ),
    );

    _seriesLinearData.add(
      charts.Series(
        id: "SalesMACD",
        colorFn: (_,__)=> charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearPoints points,_) => points.year,
        measureFn: (LinearPoints points,_)=> points.sales,
        data: linear1,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    ///initializing Pie data series
    _seriesPieData = List<charts.Series<Task, String>>();

    ///initializing bar chart
    _seriesPolutionData = List<charts.Series<Polution, String>>();

    ///initializing sharpe sharpe chart
    _seriesSharpeData = List<charts.Series<MACD, double>>();

    ///initializing sharpe linear chart
    _seriesLinearData = List<charts.Series<LinearPoints, int>>();

    ///THIS GENERATES ALL THE DATA
    _generateData();
//    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(

            backgroundColor: Color(0xff1976d2),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: <Widget>[
                Tab(
                  icon: Icon(FontAwesomeIcons.chartPie),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chartLine),
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.chartArea),
                ),
              ],
            ),
            title: Text('My Stocks Charts'),
          ),
          ///creating the drawer for the homepage/dashboard
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
                  onTap:(){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/portfolio");
                  },

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

          body: TabBarView(
            children: <Widget>[
              Padding(
                ///Adding individual charts
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'APPLE STOCKS',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        ///adding the chart
                        child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(seconds: 5),
                          behaviors: [
                            new charts.DatumLegend(
                              outsideJustification:
                                  charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding:
                                  new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                color:
                                    charts.MaterialPalette.purple.shadeDefault,
                                fontFamily: 'Georgia',
                                fontSize: 11,
                              ),
                            ),
                          ],
                          defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 100,
                            arcRendererDecorators: [
                              new charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.inside,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                ///Adding individual charts
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'YEARLY STOCKS',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        ///adding the chart
                        child: charts.BarChart(
                          _seriesPolutionData,
                          animate: true,
                          animationDuration: Duration(seconds: 5),
                          behaviors: [
                            new charts.DatumLegend(
                              outsideJustification:
                                  charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding:
                                  new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                color:
                                    charts.MaterialPalette.purple.shadeDefault,
                                fontFamily: 'Georgia',
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                ///Adding individual charts
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'YEARLY STOCKS',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        ///adding the chart
                        child: charts.LineChart(
                          _seriesSharpeData,
                          defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true,stacked: true
                          ),
                          animate: true,
                          animationDuration: Duration(seconds: 5),
                          behaviors: [
                            new charts.ChartTitle("AAPL",
                                behaviorPosition:
                                    charts.BehaviorPosition.bottom,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),Padding(
                ///Adding individual charts
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'My MACD',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        ///adding the chart
                        child: charts.LineChart(
                          _seriesLinearData,
                          defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true,stacked: true
                          ),
                          animate: true,
                          animationDuration: Duration(seconds: 5),
                          behaviors: [
                            new charts.ChartTitle("AAPL",
                                behaviorPosition:
                                    charts.BehaviorPosition.bottom,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///creating my task classes
///graph values
class Task {
  String task;
  double taskValues;
  Color colorValues;

  Task(this.task, this.taskValues, this.colorValues);
}

///for test purpuses i'm using a pollution dummy CDataSection
class Polution {
  String stock_name;
  double stock_quantity;
  double price;
  double open;
  double high;
  double low;
  double close;

  Polution(this.stock_name, this.stock_quantity, this.price, this.open,
      this.high, this.low, this.close);
}

///LINEAR CHARTS
///THIS IS PROBABLY WHERE MY MACD AND OTHER STRATEGIES WILL GO
class MACD {
//  String date;
  double price;
  double open;
  double high;
  double low;
  double close;

  MACD( this.price, this.open, this.high, this.low, this.close);
}

class LinearPoints{
  int year;
  double sales;

  LinearPoints(this.year, this.sales);
}
