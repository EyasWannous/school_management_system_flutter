import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:teacher_app/model/assignments_model.dart';

import 'package:teacher_app/model/event_model.dart';
import 'package:teacher_app/model/grade_model.dart';
import 'package:teacher_app/model/posts_by_section_model.dart';
import 'package:teacher_app/model/teacher_profile_model.dart';
import 'package:teacher_app/model/schedule_model.dart';
import 'package:teacher_app/model/students_model.dart';

import '../constant/days.dart';
import '../constant/my_url.dart';
import '../model/courses_model.dart';
import '../model/sections_model.dart';
import '../model/student_profile_model.dart';

class RestAPIGet {
  // GetStorage().read('token');
  static Future<Map<DateTime, List<Event>>> getevents() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${MyURL.url}calendar'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log('-------------');
        Map<DateTime, List<Event>> convertedMap = {};

        var res = jsonDecode(response.body)['data'];
        // log(res);

        res.forEach((key, value) {
          try {
            DateTime dateTimeAfterParsing = DateTime.parse(key);
            DateTime dateTime = DateTime.utc(dateTimeAfterParsing.year,
                dateTimeAfterParsing.month, dateTimeAfterParsing.day);
            log('$dateTime');
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
            // log('object');
            log('getevents Funtion:');
            log('$err');
          }
        });

        return convertedMap;
      } else if (response.statusCode == 400) {
        log('getevents Funtion:');
        log('$response');
      }
    } catch (error) {
      log('getevents Funtion:');
      log('$error');
    }
    return {Days.today: []};
  }

  static Future<List<ScheduleModel>> getschedule(String day) async {
    List<ScheduleModel> lsm = [];
    try {
      http.Response response = await http
          .get(Uri.parse('${MyURL.url}teachers/schedule?day=$day'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MyURL.token}'
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        lsm.addAll(ListScheduleModel.fromJson(jsonDecode(response.body))
            .scheduleModel!);
        lsm.removeWhere((element) => element.order == null);
        lsm.sort((a, b) => a.order!.compareTo(b.order!));
        return lsm;
      } else if (response.statusCode == 400) {
        log('getschedule Funtion:');
        log('$response');
      }
    } catch (error) {
      log('getschedule Funtion:');
      log('$error');
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
        // log('-------------');
        // var res = jsonDecode(response.body)['data'];
        // log(jsonDecode(response.body)['data']);
        // ls.addAll(jsonDecode(response.body)['data']);
        for (var item in jsonDecode(response.body)['data']) {
          ls.add(item);
        }
        return ls;
      } else if (response.statusCode == 400) {
        log('getdays Funtion in statusCode :');
        log('$response');
      }
    } catch (error) {
      log('getdays Funtion in cathc :');
      log('$error');
      // throw Exception((e) => log(e));
    }
    return [];
  }

  static Future<StudentsModel> getstudents(String sectionId) async {
    StudentsModel sm = StudentsModel();
    try {
      http.Response response = await http.get(
          Uri.parse('${MyURL.url}teachers/sections/$sectionId/students'),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${MyURL.token}'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        sm = StudentsModel.fromJson(jsonDecode(response.body));
        return sm;
      } else if (response.statusCode == 400) {
        log('getstudents Funtion in statusCode:');
        log('$response');
      }
    } catch (error) {
      log('getstudents Funtion in catch:');
      log('$error');
    }
    return sm;
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
      // log('-------------');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log('-------------');
        // var res = SectionsModel.fromJson(jsonDecode(response.body));
        // log(jsonDecode(response.body));
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
        log('getsections Funtion in statusCode :');
        log('$response');
      }
    } catch (error) {
      log('getsections Funtion in catch :');
      log('$error');
      // throw Exception((e) => log(e));
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
        // log('-------------');
        // var res = GradeModel.fromJson(jsonDecode(response.body));
        // log(jsonDecode(response.body));
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
        log('getgrades Funtion in statusCode :');
        log('$response');
      }
    } catch (error) {
      log('getgrades Funtion in cathc :');
      log('$error');
      // throw Exception((e) => log(e));
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
        // log('-------------');
        // var res = GradeModel.fromJson(jsonDecode(response.body));
        // log(jsonDecode(response.body));
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
        log('getcourses Funtion in statusCode :');
        log('$response');
      }
    } catch (error) {
      log('getcourses Funtion in cathc :');
      log('$error');
      // throw Exception((e) => log(e));
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
        // log(jsonDecode(response.body));
        for (var item in res) {
          ls.add(item);
        }
        return ls;
      } else if (response.statusCode == 400) {
        log('getcourses Funtion in statusCode :');
        log('$response');
      }
    } catch (error) {
      log('getcourses Funtion in cathc :');
      log('$error');
      // throw Exception((e) => log(e));
    }
    return [];
  }

  static Future<TeacherProfile> getteacherprofile() async {
    TeacherProfile tpf = TeacherProfile();
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
        log('getteacherprofile Funtion in statusCode :');
        log('$response');
      }
    } catch (error) {
      log('getteacherprofile Funtion in cathc :');
      log('$error');
      // throw Exception((e) => log(e));
    }
    return tpf;
  }

  static Future<dynamic> getteachers() async {
    // List<Teacher> lt = [];
    try {
      http.Response response = await http
          .get(Uri.parse('${MyURL.url}teachers/teachers-attendance'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MyURL.token}'
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.body);
        // lt.addAll(TeachersModel.fromJson(jsonDecode(response.body)).data!);
        return jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        log('getteachers Funtion in statusCode:');
        log('$response');
      }
    } catch (error) {
      log('getteachers Funtion in catch:');
      log('$error');
    }
    return;
  }

  static Future<List<PostsTS>> getpoststoshow(String id) async {
    List<PostsTS> pts = [];
    try {
      http.Response response = await http.get(
        Uri.parse('${MyURL.url}teachers/grades/$id/posts'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${MyURL.token}'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.body);
        pts.addAll(PostsBySections.fromJson(jsonDecode(response.body)).data!);
        return pts;
      } else if (response.statusCode == 400) {
        log('getpoststoshow Funtion:');
        log('$response');
      }
    } catch (error) {
      log('getpoststoshow Funtion in catch:');
      log('$error');
    }
    return [];
  }

  static Future<StudentProfile> getstudentprofile(String id) async {
    StudentProfile sp = StudentProfile();
    try {
      http.Response response = await http
          .get(Uri.parse('${MyURL.url}teachers/students/$id'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MyURL.token}'
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = StudentProfileModel.fromJson(jsonDecode(response.body));
        sp = res.profile!;
        return sp;
      } else if (response.statusCode == 400) {
        log('getstudentprofile Funtion in statusCode :');
        log('$response');
      }
    } catch (error) {
      log('getstudentprofile Funtion in cathc :');
      log('$error');
    }
    return sp;
  }

  static Future<List<AssignmentsToShow>> getassignments(String id) async {
    List<AssignmentsToShow> sp = [];
    try {
      http.Response response = await http.get(
          Uri.parse('${MyURL.url}teachers/sections/$id/assignments'),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${MyURL.token}'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        sp.addAll(AssignmentsModel.fromJson(jsonDecode(response.body)).data!);
        return sp;
      } else if (response.statusCode == 400) {
        log('getassignments Funtion in statusCode :');
        log('$response');
      }
    } catch (error) {
      log('getassignments Funtion in cathc :');
      log('$error');
    }
    return sp;
  }

  static Future<int?> getmarkofstudent(
      String studentID, String type, String courseID) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              '${MyURL.url}teachers/students/$studentID/mark?course_id=$courseID&type=$type'),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${MyURL.token}'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = jsonDecode(response.body);
        log(res);
        return res['mark'];
      } else if (response.statusCode == 400) {
        log('getmarkofstudent Funtion in statusCode :');
        log('$response');
      }
    } catch (error) {
      log('getmarkofstudent Funtion in cathc :');
      log('$error');
    }
    return null;
  }
}
