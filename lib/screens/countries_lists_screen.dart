import 'package:covid19_tracker/model/countries_state_model.dart';
import 'package:covid19_tracker/screens/detailed_screen.dart';
import 'package:covid19_tracker/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListsScreen extends StatefulWidget {
  const CountriesListsScreen({super.key});

  @override
  State<CountriesListsScreen> createState() => _CountriesListsScreenState();
}

class _CountriesListsScreenState extends State<CountriesListsScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();

    return Scaffold(
      appBar: AppBar(title: Text('All Countries Data')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: SearchBar(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
              hintText: 'Search country',
              leading: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: statesServices.fetchCountriesStates(),
              builder:
                  (
                    BuildContext context,
                    AsyncSnapshot<List<CountriesStatesModel>> snapshot,
                  ) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Shimmer.fromColors(
                            highlightColor: Colors.grey.shade700,
                            baseColor: Colors.grey.shade100,
                            child: ListTile(
                              leading: Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey,
                              ),
                              title: Container(
                                width: 90,
                                height: 15,
                                color: Colors.grey,
                              ),
                              subtitle: Container(
                                width: 90,
                                height: 15,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (searchController.text.isEmpty) {
                          return customCard(
                            snapshot.data![index].country,
                            snapshot.data![index].cases.toString(),
                            snapshot.data![index].countryInfo.flag,
                            snapshot.data![index].country,
                            snapshot.data![index].continent.name,
                            snapshot.data![index].deaths,
                            snapshot.data![index].population,
                            snapshot.data![index].recovered,
                            snapshot.data![index].tests,
                            snapshot.data![index].cases,
                          );
                        } else if (snapshot.data![index].country
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return customCard(
                            snapshot.data![index].country,
                            snapshot.data![index].cases.toString(),
                            snapshot.data![index].countryInfo.flag,
                            snapshot.data![index].country,
                            snapshot.data![index].continent.name,
                            snapshot.data![index].deaths,
                            snapshot.data![index].population,
                            snapshot.data![index].recovered,
                            snapshot.data![index].tests,
                            snapshot.data![index].cases,
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  },
            ),
          ),
        ],
      ),
    );
  }

  Widget customCard(
    String title,
    String subTitle,
    String imageUrl,
    String country,
    String continent,
    int deaths,
    int population,
    int recovered,
    int tests,
    int totalCases,
    // void Function()? onTap,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedScreen(
                  imgUrl: imageUrl,
                  continent: continent,
                  country: country,
                  deaths: deaths,
                  population: population,
                  recovered: recovered,
                  tests: tests,
                  totalCases: totalCases,
                ),
              ),
            );
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage("$imageUrl?width=50&height=50"),
            radius: 25,
          ),
          title: Text(title),
          subtitle: Text(subTitle),
        ),
      ),
    );
  }
}
