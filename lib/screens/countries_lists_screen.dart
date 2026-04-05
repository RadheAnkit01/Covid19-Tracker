import 'package:covid19_tracker/model/countries_state_model.dart';
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
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "${snapshot.data![index].countryInfo.flag}?width=50&height=50",
                                  ),
                                  radius: 25,
                                ),
                                title: Text(snapshot.data![index].country),
                                subtitle: Text(
                                  snapshot.data![index].cases.toString(),
                                ),
                              ),
                            ),
                          );
                        } else if (snapshot.data![index].country
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "${snapshot.data![index].countryInfo.flag}?width=50&height=50",
                                  ),
                                  radius: 25,
                                ),
                                title: Text(snapshot.data![index].country),
                                subtitle: Text(
                                  snapshot.data![index].cases.toString(),
                                ),
                              ),
                            ),
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
}
