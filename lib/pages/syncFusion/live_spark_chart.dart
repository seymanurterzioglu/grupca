import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grupca/constant/size_config.dart';
import 'package:grupca/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class LiveSparkChart extends StatefulWidget {
  const LiveSparkChart({Key? key}) : super(key: key);

  @override
  State<LiveSparkChart> createState() => _LiveSparkChartState();
}

class _LiveSparkChartState extends State<LiveSparkChart> {
  late double _size;
  late Timer _timer;
  late bool _isVertical;
  late String _cpuValue;
  late List<double> _cpuData;

  @override
  void initState() {
    _size = 140;
    _isVertical = false;
    _cpuData = <double>[20, 19, 39, 25, 11, 28, 34, 28];
    _cpuValue = _cpuData[_cpuData.length - 1].round().toString();
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), _updateData);
  }

  @override
  void dispose() {
    _cpuData = <double>[];
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Spark chart'),
      ),
      body: SizedBox(
        height: getProportionateScreenHeight(300),
        width: getProportionateScreenWidth(350),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getProportionateScreenHeight(5)),
                  Container(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: const Text(
                      'CPU',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Container(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(
                      '$_cpuValue'
                          '%'
                          ' '
                          '${int.parse(_cpuValue) / 5}'
                          ' GHz',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: themeData.isDarkMode ? Colors.purple : Colors.orangeAccent,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Expanded(
                      child: SfSparkAreaChart(
                        data: _cpuData,
                        axisLineWidth: 0,
                        color:
                        themeData.isDarkMode ? Colors.purple : Colors.orangeAccent,
                        borderColor: themeData.isDarkMode ? Colors.white70 : Colors.black45,
                        borderWidth: 1,
                      ))
                ]),
          ),
        ),
      ),
    );
  }


  void _updateData(Timer timer) {
    if (_cpuData.length > 10) {
      _cpuData.removeAt(0);
    }

    setState(() {
      _cpuData = List<double>.from(_getCPUData());

      _cpuValue = _cpuData[_cpuData.length - 1].round().toString();
    });
  }

  List<double> _getCPUData() {
    _cpuData.add(_getRandomInt(0, 40));
    return _cpuData;
  }

  double _getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min).toDouble();
  }
}
