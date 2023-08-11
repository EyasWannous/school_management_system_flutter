import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_app/models/program_model.dart';

import '../models/assignments_model.dart';
import '../models/show_post_model.dart';
import '../models/totals_model.dart';
import 'my_url.dart';

class RestAPIGet {
  static Future<List<PostsToShow>> getpoststoshow() async {
    List<PostsToShow> pts = [];
    try {
      http.Response response = await http.get(
        Uri.parse('${MyURL.url}students/posts'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${MyURL.token}'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        pts.addAll(ShowPostsModel.fromJson(jsonDecode(response.body)).posts!);
        return pts;
      } else if (response.statusCode == 400) {
        print('getschedule Funtion:');
        print(response);
      }
    } catch (error) {
      print('getschedule Funtion in catch:');
      print(error);
    }
    return [];
  }

  static Future<List<Totals>> gettotals(String year) async {
    List<Totals> lt = [];
    try {
      http.Response response = await http.get(
        Uri.parse('${MyURL.url}students/totals?year=$year'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${MyURL.token}'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        lt.addAll(ShowTotalsModel.fromJson(jsonDecode(response.body)).totals!);
        return lt;
      } else if (response.statusCode == 400) {
        print('gettotals Funtion:');
        print(response);
      }
    } catch (error) {
      print('gettotals Funtion in catch:');
      print(error);
    }
    return [];
  }

  static Future<List<AssignmentsToShow>> getassignments(String id) async {
    List<AssignmentsToShow> lato = [];
    try {
      http.Response response = await http.get(
        Uri.parse('${MyURL.url}students/assignments?course_id=$id'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${MyURL.token}'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        lato.addAll(
            AssignmentsModel.fromJson(jsonDecode(response.body)).assignments!);
        return lato;
      } else if (response.statusCode == 400) {
        print('getassignments Funtion:');
        print(response);
      }
    } catch (error) {
      print('getassignments Funtion in catch:');
      print(error);
    }
    return [];
  }

  static Future<ProgramModel> getprogram() async {
    ProgramModel pm = ProgramModel();
    try {
      http.Response response = await http.get(
        Uri.parse('${MyURL.url}students/schedules'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${MyURL.token}'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        pm = ProgramModel.fromJson(jsonDecode(response.body)['schedule']);
        return pm;
      } else if (response.statusCode == 400) {
        print('getprograme Funtion:');
        print(response);
      }
    } catch (error) {
      print('getprograme Funtion in catch:');
      print(error);
    }
    return pm;
  }
}
