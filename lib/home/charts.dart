import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:flutter_application_6/home/home.dart';
import 'package:flutter_application_6/home/home_view.dart';
import 'package:flutter_application_6/model/isp.dart';

class MyHomePage extends StatefulWidget {
   final Isp? model;
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<_SalesData> data = [
    _SalesData('Jan', 0),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 80)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios ,color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('AKONET', style: TextStyle(color: Colors.black)),
        ),
        body: Column(children: [
           Container(
                      height: 250,
                      width: 450,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(6),
                              bottomLeft: Radius.circular(6)),
                          image: DecorationImage(
                              image: NetworkImage(widget.model?.image ?? ''))),
                    ),
                  const   SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
                color: Colors.brown, borderRadius: BorderRadius.circular(25)),
          ),
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'paketloss'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Downtime',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
                //Enable the trackball
                trackball: const SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker:const  SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              ),
            ),
          )
        ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
