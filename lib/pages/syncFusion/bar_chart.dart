import 'package:flutter/material.dart';
import 'package:grupca/pages/syncFusion/sample_data.dart';
import 'package:grupca/theme_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constant/size_config.dart';

class BarChart extends StatefulWidget {
  BarChart({Key? key}) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  bool isCardView = false;

  List<ChartSampleData>? chartData;


  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Fransa',
          y: 84452000,
          secondSeriesYValue: 82682000,
          thirdSeriesYValue: 86861000),
      ChartSampleData(
          x: 'İspanya',
          y: 68175000,
          secondSeriesYValue: 75315000,
          thirdSeriesYValue: 81786000),
      ChartSampleData(
          x: 'Amerika',
          y: 77774000,
          secondSeriesYValue: 76407000,
          thirdSeriesYValue: 76941000),
      ChartSampleData(
          x: 'Italya',
          y: 50732000,
          secondSeriesYValue: 52372000,
          thirdSeriesYValue: 58253000),
      ChartSampleData(
          x: 'Meksika',
          y: 32093000,
          secondSeriesYValue: 35079000,
          thirdSeriesYValue: 39291000),
      ChartSampleData(
          x: 'İngiltere',
          y: 34436000,
          secondSeriesYValue: 35814000,
          thirdSeriesYValue: 37651000),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar chart'),
      ),
      body: SizedBox(
        height: getProportionateScreenHeight(550),
        child: Padding(
          padding: EdgeInsets.only( right: 20),
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            title: ChartTitle(
                text: isCardView ? '' : 'Turizm - Yıllara göre Turist Nüfusu'),
            legend: Legend(isVisible: !isCardView),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
                majorGridLines: const MajorGridLines(width: 0),
                numberFormat: NumberFormat.compact()),
            series: <BarSeries<ChartSampleData, String>>[
              BarSeries<ChartSampleData, String>(
                dataSource: chartData!,
                xValueMapper: (ChartSampleData sales, _) => sales.x as String,
                yValueMapper: (ChartSampleData sales, _) => sales.y,
                name: '2015',
                color: Colors.blue,
              ),
              BarSeries<ChartSampleData, String>(
                dataSource: chartData!,
                xValueMapper: (ChartSampleData sales, _) => sales.x as String,
                yValueMapper: (ChartSampleData sales, _) =>
                    sales.secondSeriesYValue,
                name: '2016',
                color: Colors.deepPurpleAccent,
              ),
              BarSeries<ChartSampleData, String>(
                dataSource: chartData!,
                xValueMapper: (ChartSampleData sales, _) => sales.x as String,
                yValueMapper: (ChartSampleData sales, _) =>
                    sales.thirdSeriesYValue,
                name: '2017',
                color: Colors.red,
              ),
            ],
            tooltipBehavior: TooltipBehavior(
                enable: true,
                textAlignment: ChartAlignment.far,
                header: 'DATAS',
                // show color
                canShowMarker: true,
                color: themeData.isDarkMode ? Colors.purple : Colors.orangeAccent,
                textStyle: TextStyle(
                    color: Colors.white, fontSize: getProportionateScreenHeight(15)),
                format: 'point.x\nGDP growth rate : point.y\nPopulation : point.sizeB'),
          ),
        ),
      ),
    );
  }
}
