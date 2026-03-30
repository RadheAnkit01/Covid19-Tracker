// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatus extends StatefulWidget {
  const WorldStatus({super.key});

  @override
  State<WorldStatus> createState() => _WorldStatusState();
}

class _WorldStatusState extends State<WorldStatus>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 4),
  )..repeat();

  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5346),
  ];
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('World Status')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              PieChart(
                dataMap: {"Total": 20, "Recovered": 15, "Death": 5},
                animationDuration: const Duration(seconds: 2),
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width * .4,
                colorList: colorList,
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.left,
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      ReuseableRow(title: 'Total', value: '200'),
                      ReuseableRow(title: 'Recovered', value: '150'),
                      ReuseableRow(title: 'Death', value: '50'),
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

class ReuseableRow extends StatelessWidget {
  final String title, value;
  const ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [Text(title), SizedBox(width: 5), Text(value)]),
        SizedBox(height: 5),
        Divider(color: Colors.grey),
      ],
    );
  }
}
