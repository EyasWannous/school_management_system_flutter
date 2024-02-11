import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/model/serach_model.dart';

import '../screen/student_profile.dart';

class SearchStudents extends SearchDelegate {
  final List<SearchModel> searchTerms;

  SearchStudents({required this.searchTerms});

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
        var item = matchQuery[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            tileColor: const Color.fromRGBO(233, 238, 252, 1),
            title: Text(item.name), // name fo students
            trailing: const Icon(Icons.arrow_forward), // may be arrow icon
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            onTap: () {
              Get.to(() => const StudentProfile(), arguments: [item.id]);
            }, // go to student profile
          ),
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
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var item = matchQuery[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            tileColor: const Color.fromRGBO(233, 238, 252, 1),
            title: Text(item.name),
            trailing: const Icon(Icons.arrow_forward),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            onTap: () {
              Get.to(() => const StudentProfile(), arguments: [item.id]);
            },
          ),
        );
      },
    );
  }
}
