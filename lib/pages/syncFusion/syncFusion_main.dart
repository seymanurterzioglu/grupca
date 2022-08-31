import 'package:flutter/material.dart';
import 'package:grupca/constant/button.dart';
import 'package:grupca/pages/syncFusion/bar_chart.dart';
import 'package:grupca/pages/syncFusion/bubble_chart.dart';
import 'package:grupca/constant/size_config.dart';
import 'package:grupca/pages/syncFusion/circular_chart.dart';
import 'package:grupca/pages/syncFusion/line_chart.dart';
import 'package:grupca/pages/syncFusion/live_spark_chart.dart';

class SyncFusion extends StatefulWidget {
  const SyncFusion({Key? key}) : super(key: key);

  @override
  State<SyncFusion> createState() => _SyncFusionState();
}

class _SyncFusionState extends State<SyncFusion> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              press: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LineChart()),
                );
              },
              text: 'Line Chart',
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Button(
              press: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BubbleChart()),
                );
              },
              text: 'Bubble Chart',
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Button(
              press: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarChart()),
                );
              },
              text: 'Bar Chart',
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Button(
              press: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CircularChart()),
                );
              },
              text: 'Circular Chart',
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Button(
              press: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LiveSparkChart()),
                );
              },
              text: 'Live Spark Chart',
            ),
          ],
        ),
      ),
    );
  }
}
