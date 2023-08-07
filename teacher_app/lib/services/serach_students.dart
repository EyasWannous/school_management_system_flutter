import 'package:flutter/material.dart';
import 'package:teacher_app/model/serach_model.dart';

class SearchStudents extends SearchDelegate {
  final List<SearchModel> searchTerms;

  SearchStudents({required this.searchTerms});

  // final List<String> searchTerms = [
  //   'Apple',
  //   'Banana',
  //   "Pear",
  //   "Watermelons",
  //   "Oranges",
  //   "Blueberries",
  //   "Strawberries",
  //   "Raspberries",
  // ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<SearchModel> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.name),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SearchModel> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.name),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
