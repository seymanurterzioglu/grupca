import 'package:flutter/material.dart';
import 'package:grupca/pages/syncFusion/sample_data.dart';
import 'package:grupca/theme_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constant/size_config.dart';



class BubbleChart extends StatelessWidget {


  // TooltipBehavior? _tooltipBehavior;

  // @override
  // void initState() {
  //   _tooltipBehavior = TooltipBehavior(
  //       enable: true,
  //       textAlignment: ChartAlignment.far,
  //       header: 'DATAS',
  //       // show color
  //       canShowMarker: true,
  //       color: Colors.orangeAccent,
  //       textStyle: TextStyle(
  //           color: Colors.white, fontSize: getProportionateScreenHeight(15)),
  //       format: 'point.x\nGDP growth rate : point.y\nPopulation : point.sizeB');
  // }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context);
    bool isCardView = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bubble chart'),
      ),
      body: SizedBox(
        height: getProportionateScreenHeight(400),
        child: SfCartesianChart(
          title: ChartTitle(text: isCardView ? '' : 'Alan (km²) lara göre Ülkeler'),
          plotAreaBorderWidth: 0,
          // string için CategoryAxis(), num için NumericAxis()
          primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              title: AxisTitle(text: 'Ülkeler'),
              // x Axis label direction
              labelIntersectAction: AxisLabelIntersectAction.rotate45),

          primaryYAxis: NumericAxis(
              numberFormat: NumberFormat.compact(),
              title: AxisTitle(text: isCardView ? '' : 'Alan(km²)'),
              axisLine: const AxisLine(width: 2),
              minimum: 650000,
              maximum: 1500000,
              rangePadding: ChartRangePadding.additional,
              majorTickLines: const MajorTickLines(size: 0)),
          series: _getPointColorBubbleSeries(),
          // tooltipbehavior color temaya göre değiştirilmesi için initState() de tanımlanmadı
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
    );
  }
  List<BubbleSeries<ChartSampleData, String>> _getPointColorBubbleSeries() {
    return <BubbleSeries<ChartSampleData, String>>[
      BubbleSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(
              x: 'Namibya',
              y: 825615,
              size: 0.30,
              pointColor: const Color.fromRGBO(1, 180, 220, 200)),
          ChartSampleData(
              x: 'Angola',
              y: 1246700,
              size: 0.84,
              pointColor: const Color.fromRGBO(53, 124, 210, 1)),
          ChartSampleData(
              x: 'Tanzanya',
              y: 945087,
              size: 0.64,
              pointColor: const Color.fromRGBO(221, 138, 189, 1)),
          ChartSampleData(
              x: 'Mısır',
              y: 1002450,
              size: 0.68,
              pointColor: const Color.fromRGBO(248, 184, 131, 1)),
          ChartSampleData(
              x: 'Nijerya',
              y: 923768,
              size: 0.62,
              pointColor: const Color.fromRGBO(112, 173, 71, 1)),
          ChartSampleData(
              x: 'Peru',
              y: 1285216,
              size: 0.87,
              pointColor: const Color.fromRGBO(0, 189, 174, 1)),
        ],
        opacity: 0.8,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        pointColorMapper: (ChartSampleData sales, _) => sales.pointColor,
        sizeValueMapper: (ChartSampleData sales, _) => sales.size,
      )
    ];
  }

}
