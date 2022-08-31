import 'package:flutter/material.dart';
import 'package:grupca/constant/size_config.dart';
import 'package:grupca/pages/syncFusion/sample_data.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../theme_data.dart';

class CircularChart extends StatefulWidget {
  CircularChart({Key? key}) : super(key: key);

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  bool isCardView = false;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      format: 'point.x : point.y%',
      color: Colors.orangeAccent,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular chart'),
      ),
      body: SizedBox(
        child: SfCircularChart(
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
          title: ChartTitle(text: isCardView ? '' : 'Evde İş Yapma Oranı'),
          legend: Legend(isVisible: !isCardView),
          series: _getDefaultPieSeries(),
        ),
      ),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries() {
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '10%',
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Hasan', y: 15, text: 'Hasan \n 15%'),
            ChartSampleData(
                x: 'Yusuf',
                y: 5,
                text: 'Yusuf \n 5%',
                pointColor: const Color.fromRGBO(0, 189, 174, 1)),
            ChartSampleData(
                x: 'Seyma',
                y: 35,
                text: 'Seyma \n 35%',
                pointColor: const Color.fromRGBO(70, 10, 194, 110)),
            ChartSampleData(x: 'Fatma', y: 45, text: 'Fatma \n 45%'),
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          pointColorMapper: (ChartSampleData sales, _) => sales.pointColor,
          opacity: 0.8,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }
}
