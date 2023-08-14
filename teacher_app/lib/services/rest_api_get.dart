import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:teacher_app/model/event_model.dart';
import 'package:teacher_app/model/grade_model.dart';
import 'package:teacher_app/model/profile_model.dart';
import 'package:teacher_app/model/schedule_model.dart';
import 'package:teacher_app/model/students_model.dart';

import '../constant/days.dart';
import '../constant/my_url.dart';
import '../model/courses_model.dart';
import '../model/sections_model.dart';

class RestAPIGet {
  static Future<Map<DateTime, List<Event>>> getevents() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${MyURL.url}calendar'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('-------------');
        Map<DateTime, List<Event>> convertedMap = {};

        var res = jsonDecode(response.body)['data'];
        // print(res);

        res.forEach((key, value) {
          try {
            DateTime dateTimeAfterParsing = DateTime.parse(key);
            DateTime dateTime = DateTime.utc(dateTimeAfterParsing.year,
                dateTimeAfterParsing.month, dateTimeAfterParsing.day);
            print(dateTime);
            List<Event> events = (value as List)
                .map(
                  (e) => Event(
                    title: e['title'],
                    isHoliday: e['type'] == 'holiday',
                    time: DateFormat.Hm().format(dateTimeAfterParsing),
                    content: e['content'],
                  ),
                )
                .toList();
            convertedMap[dateTime] = events;
          } catch (err) {
            // print('object');
            print('getevents Funtion:');
            print(err);
          }
        });

        return convertedMap;
      } else if (response.statusCode == 400) {
        print('getevents Funtion:');
        print(response);
      }
    } catch (error) {
      print('getevents Funtion:');
      print(error);
    }
    return {Days.today: []};
  }

  static Future<List<ScheduleModel>> getschedule(String day) async {
    List<ScheduleModel> lsm = [];
    ScheduleModel sm;
    try {
      http.Response response = await http
          .get(Uri.parse('${MyURL.url}teachers/schedule?day=$day'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MyURL.token}'
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('-------------');
        // var res = ;
        lsm.addAll(ListScheduleModel.fromJson(jsonDecode(response.body))
            .scheduleModel!);
        // print(res1);
        // for (var item in res.scheduleModel!) {
        //   sm = ScheduleModel(
        //     order: item.order,
        //     courseName: item.courseName,
        //     day: item.day,
        //     startAt: item.startAt,
        //     endAt: item.endAt,
        //     grade: item.grade,
        //     section: item.section,
        //   );
        //   lsm.add(sm);
        // }
        lsm.removeWhere((element) => element.order == null);
        lsm.sort((a, b) => a.order!.compareTo(b.order!));

        return lsm;
      } else if (response.statusCode == 400) {
        print('getschedule Funtion:');
        print(response);
      }
    } catch (error) {
      print('getschedule Funtion:');
      print(error);
    }
    return [];
  }

  static Future<List<String>> getdays() async {
    List<String> ls = [];
    try {
      http.Response response = await http
          .get(Uri.parse('${MyURL.url}teachers/schedule/days'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MyURL.token}'
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('-------------');
        // var res = jsonDecode(response.body)['data'];
        // print(jsonDecode(response.body)['data']);
        // ls.addAll(jsonDecode(response.body)['data']);
        for (var item in jsonDecode(response.body)['data']) {
          ls.add(item);
        }
        return ls;
      } else if (response.statusCode == 400) {
        print('getdays Funtion in statusCode :');
        print(response);
      }
    } catch (error) {
      print('getdays Funtion in cathc :');
      print(error);
      // throw Exception((e) => print(e));
    }
    return [];
  }

  static Future<List<Student>> getstudents(String sectionId) async {
    List<Student> ls = [];
    Student s;
    try {
      http.Response response = await http.get(
          Uri.parse('${MyURL.url}teachers/sections/$sectionId/students'),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${MyURL.token}'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('-------------');
        // var res = StudentsModel.fromJson(jsonDecode(response.body));
        ls.addAll(StudentsModel.fromJson(jsonDecode(response.body)).data!);
        // print(jsonDecode(response.body));
        // for (var item in res.data!) {
        //   s = Student(
        //     id: item.id,
        //     address: item.address,
        //     bio: item.bio,
        //     dateOfBirth: item.dateOfBirth,
        //     firstName: item.firstName,
        //     gender: item.gender,
        //     imageUrl: item.imageUrl,
        //     lastName: item.lastName,
        //     middleName: item.middleName,
        //     phoneNumber: item.phoneNumber,
        //     type: item.type,
        //     username: item.username,
        //     absence: item.absence,
        //   );
        //   ls.add(s);
        // }
        return ls;
      } else if (response.statusCode == 400) {
        print('getstudents Funtion in statusCode:');
        print(response);
      }
    } catch (error) {
      print('getstudents Funtion in catch:');
      print(error);
    }
    return [];
  }

  static Future<List<Section>> getsections(String gradeId) async {
    List<Section> ls = [];
    try {
      http.Response response = await http.get(
          Uri.parse('${MyURL.url}teachers/grades/$gradeId/sections'),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${MyURL.token}'
          });
      // print('-------------');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('-------------');
        // var res = SectionsModel.fromJson(jsonDecode(response.body));
        // print(jsonDecode(response.body));
        ls.addAll(SectionsModel.fromJson(jsonDecode(response.body)).data!);
        // for (var item in res.data!) {
        //   s = Section(
        //     id: item.id,
        //     gradeId: item.gradeId,
        //     name: item.name,
        //     number: item.number,
        //   );
        //   ls.add(s);
        // }
        return ls;
      } else if (response.statusCode == 400) {
        print('getsections Funtion in statusCode :');
        print(response);
      }
    } catch (error) {
      print('getsections Funtion in catch :');
      print(error);
      // throw Exception((e) => print(e));
    }
    return [];
  }

  static Future<List<Grade>> getgrades() async {
    List<Grade> lg = [];
    try {
      http.Response response =
          await http.get(Uri.parse('${MyURL.url}teachers/grades'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MyURL.token}'
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('-------------');
        // var res = GradeModel.fromJson(jsonDecode(response.body));
        // print(jsonDecode(response.body));
        lg.addAll(GradeModel.fromJson(jsonDecode(response.body)).data!);
        // for (var item in res.data!) {
        //   s = Grade(
        //     id: item.id,
        //     name: item.name,
        //     number: item.number,
        //     type: item.type,
        //   );
        //   lg.add(s);
        // }
        return lg;
      } else if (response.statusCode == 400) {
        print('getgrades Funtion in statusCode :');
        print(response);
      }
    } catch (error) {
      print('getgrades Funtion in cathc :');
      print(error);
      // throw Exception((e) => print(e));
    }
    return [];
  }

  static Future<List<Courses>> getcourses(String sectionId) async {
    List<Courses> lc = [];
    try {
      http.Response response = await http.get(
          Uri.parse('${MyURL.url}teachers/sections/$sectionId/courses'),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${MyURL.token}'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('-------------');
        // var res = GradeModel.fromJson(jsonDecode(response.body));
        // print(jsonDecode(response.body));
        lc.addAll(CoursesListModel.fromJson(jsonDecode(response.body)).data!);
        // for (var item in res.data!) {
        //   s = Grade(
        //     id: item.id,
        //     name: item.name,
        //     number: item.number,
        //     type: item.type,
        //   );
        //   lg.add(s);
        // }
        return lc;
      } else if (response.statusCode == 400) {
        print('getcourses Funtion in statusCode :');
        print(response);
      }
    } catch (error) {
      print('getcourses Funtion in cathc :');
      print(error);
      // throw Exception((e) => print(e));
    }
    return [];
  }

  static Future<List<String>> getmarkstypes() async {
    List<String> ls = [];
    try {
      http.Response response = await http
          .get(Uri.parse('${MyURL.url}teachers/marks/types'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MyURL.token}'
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = jsonDecode(response.body)['data'];
        // print(jsonDecode(response.body));
        for (var item in res) {
          ls.add(item);
        }
        return ls;
      } else if (response.statusCode == 400) {
        print('getcourses Funtion in statusCode :');
        print(response);
      }
    } catch (error) {
      print('getcourses Funtion in cathc :');
      print(error);
      // throw Exception((e) => print(e));
    }
    return [];
  }

  static Future<Profile> getprofile() async {
    Profile tpf = Profile();
    try {
      http.Response response =
          await http.get(Uri.parse('${MyURL.url}teachers/profile'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MyURL.token}'
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = TeacherProfileModel.fromJson(jsonDecode(response.body));
        tpf = res.profile!;
        return tpf;
      } else if (response.statusCode == 400) {
        print('getprofile Funtion in statusCode :');
        print(response);
      }
    } catch (error) {
      print('getprofile Funtion in cathc :');
      print(error);
      // throw Exception((e) => print(e));
    }
    return tpf;
  }
}
