import 'package:covid19_tracker/screens/world_status_screen.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final String imgUrl, country, continent;
  final int totalCases, recovered, deaths, tests, population;

  const DetailedScreen({
    super.key,
    required this.imgUrl,
    required this.country,
    required this.continent,
    required this.totalCases,
    required this.recovered,
    required this.deaths,
    required this.tests,
    required this.population,
  });

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.totalCases);
    return Scaffold(
      appBar: AppBar(title: Text(widget.country)),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: NetworkImage(widget.imgUrl),
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            children: [
              Text(
                'Country : ${widget.country}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Continent : ${widget.continent}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    ReuseableRow(
                      title: 'Total Cases',
                      value: widget.totalCases.toString(),
                    ),
                    ReuseableRow(
                      title: 'Recovered',
                      value: widget.recovered.toString(),
                    ),
                    ReuseableRow(
                      title: 'Deaths',
                      value: widget.deaths.toString(),
                    ),
                    ReuseableRow(
                      title: 'Tests',
                      value: widget.tests.toString(),
                    ),
                    ReuseableRow(
                      title: 'Population',
                      value: widget.population.toString(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
