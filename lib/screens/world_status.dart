// import 'dart:async';

import 'package:covid19_tracker/screens/countries_lists_screen.dart';
import 'package:covid19_tracker/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(title: Text('World Status')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              FutureBuilder(
                future: statesServices.fetchWorldStates(),
                // initialData: InitialData,
                builder:
                    (
                      BuildContext context,
                      AsyncSnapshot<Map<String, double>> snapshot,
                    ) {
                      if (!snapshot.hasData) {
                        return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50.0,
                            controller: _animationController,
                          ),
                        );
                      }
                      print(snapshot.data);
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total": double.parse(
                                snapshot.data!['cases'].toString(),
                              ),
                              "Recovered": double.parse(
                                snapshot.data!['recovered'].toString(),
                              ),
                              "Death": double.parse(
                                snapshot.data!['deaths'].toString(),
                              ),
                            },
                            chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
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
                                  ReuseableRow(
                                    title: 'Total',
                                    value: snapshot.data!['cases'].toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Recovered',
                                    value: snapshot.data!['recovered']
                                        .toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Death',
                                    value: snapshot.data!['deaths'].toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CountriesListsScreen(),
                                  ),
                                );
                              },
                              child: Text('Track Countries'),
                            ),
                          ),
                        ],
                      );
                    },
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
        Row(
          children: [
            Text(title),
            Expanded(child: SizedBox()),
            Text(value),
          ],
        ),
        SizedBox(height: 5),
        Divider(color: Colors.grey),
      ],
    );
  }
}
