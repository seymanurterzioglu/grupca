import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../constant/size_config.dart';
import '../../theme_data.dart';

class LineChart extends StatelessWidget {
  LineChart({Key? key}) : super(key: key);

  TrackballBehavior? _trackballBehavior;
  List<_SalesData> data = [
    _SalesData('Ocak', 35),
    _SalesData('Şubat', 28),
    _SalesData('Mart', 34),
    _SalesData('Nisan', 32),
    _SalesData('Mayıs', 40),
    _SalesData('Haziran', 48)
  ];

  List<_SalesData> data2 = [
    _SalesData('Ocak', 30),
    _SalesData('Şubat', 22),
    _SalesData('Mart', 39),
    _SalesData('Nisan', 34),
    _SalesData('Mayıs', 48),
    _SalesData('Haziran', 32)
  ];

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
      //tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
      enable: true, activationMode: ActivationMode.singleTap,
      lineColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line chart'),
      ),
      body: Column(
        children: [
          // 1. Chart
          SizedBox(
            height: getProportionateScreenHeight(350),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: '6 Aylık Satış Analizi'),

              // legend - grafik açıklaması
              legend: Legend(
                isVisible: true,
                //height: '30',
                //iconBorderColor: Colors.orange,
                //image: AssetImage('assets/images.png'),
              ),

              //grafik üzerinde dokunduğun yerdeki verileri ayarladığın şekilde gösterir
              // (grafik üstünde her yere dokunabilirsin)
              trackballBehavior: _trackballBehavior,

              // Grafikte tıkladığın yerin verisini gösterir (çizgilere dokunmalısın)
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'Satışlar',
                  color: Colors.red,
                  // Grafik üzerinde verilerin görünebilirliği
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
                LineSeries<_SalesData, String>(
                  dataSource: data2,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'Alımlar',
                  color: Colors.blue,

                  // Grafik üzerinde verilerin görünebilirliği
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),

          SizedBox(height: getProportionateScreenHeight(20)),
          // 2. Chart
          SizedBox(
            height: getProportionateScreenHeight(200),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SfSparkLineChart.custom(
                color: themeData.isDarkMode ? Colors.white : Colors.black,

                width: 2,
                labelStyle: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
                  fontWeight: FontWeight.bold,
                  //backgroundColor: Colors.grey,
                ),
                axisLineColor:
                    themeData.isDarkMode ? Colors.purple : Colors.orangeAccent,

                // ters çeviriyor
                isInversed: false,

                //Enable the trackball
                trackball: const SparkChartTrackball(
                    activationMode: SparkChartActivationMode.doubleTap,
                    color: Colors.orangeAccent),

                //Noktaları işaretler
                marker: const SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all,
                    // noktanın iç rengi
                    color: Colors.black,
                    // noktanın dış rengi
                    borderColor: Colors.green),

                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
