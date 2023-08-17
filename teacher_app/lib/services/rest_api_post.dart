import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teacher_app/common/my_snackbar.dart';
import 'package:teacher_app/components/bottom_bar.dart';
import 'package:teacher_app/components/principle_bottom_bar.dart';
import 'package:teacher_app/screen/login.dart';

import '../constant/my_url.dart';
import '../model/homework_section_model.dart';
import '../model/student_attendance_model.dart';
import '../model/students_post_attended_model.dart';

class RestAPIPost {
  static Future<void> postlogin(String name, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${MyURL.url}teachers/login'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'username': name,
            'password': password,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = jsonDecode(response.body);
        // print(res);

        // do logic here

        GetStorage().write('token', res["token"]);
        GetStorage().write('is_principle', res["is_principle"]);

        MyURL.token = res["token"];

        print(GetStorage().read('token'));
        print(GetStorage().read('is_principle'));

        MySnackBar.showSnackBar(message: res['message']);

        if (res["is_principle"]) {
          Get.off(const PrincipleBottomBar());
        } else {
          Get.off(const BottomBar());
        }

        return;
      } else if (response.statusCode == 400) {
        var res = jsonDecode(response.body);
        MySnackBar.showSnackBar(message: res['message']);
        print('postlogin Funtion:');
        print(response);
      } else {
        MySnackBar.showSnackBar(message: 'Check your internet connection');
      }
    } catch (error) {
      MySnackBar.showSnackBar(message: 'Check your internet connection');

      print('postlogin Funtion in catch:');
      print(error);
    }
    return;
  }

  static Future<void> postAttendanceStudents(List<AttendanceModel> list) async {
    List<Attended> jsonList = list.map((student) {
      return Attended(
        id: student.id,
        attended: student.isAttendanceToday,
      );
    }).toList();
    // print(jsonList);

    StudentsPostAttendedModel jsonObject =
        StudentsPostAttendedModel(students: jsonList);
    // print(jsonObject);

    String jsonData = jsonEncode(jsonObject.toJson());
    // print(jsonData);

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${MyURL.token}'
      };

      var request =
          http.Request('POST', Uri.parse('${MyURL.url}teachers/attendance'));
      request.body = jsonData;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Get.snackbar(
        //   'Snackbar Example', // Title
        //   response.reasonPhrase ?? ' asas ', // Message
        //   snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
        //   duration: const Duration(seconds: 3),
        // );
        // print('postAttendanceStudents :');
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
        print(messageInSncak);
      } else if (response.statusCode == 401) {
        print('postAttendanceStudents in statusCode:');
        print(response.reasonPhrase);
      } else {
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
        MySnackBar.showSnackBar(message: 'Check your internet connection');
      }
    } catch (error) {
      MySnackBar.showSnackBar(message: 'Check your internet connection');

      print('postAttendanceStudents in catch:');
      print(error);
    }
  }

  static Future<void> postHomework(List<SectionsHomeworkModel> list,
      String title, String content, String type, String deadLine) async {
    List<int?> jsonList = [];
    for (var section in list) {
      if (section.isSelected!) jsonList.add(section.id);
    }
    // = list.map((student) {
    //   if (student.isSelected!) return student.id!;
    // }).toList();
    // print(jsonList);

    List<Map<String, int>> jsonObject = [];
    for (var element in jsonList) {
      jsonObject.add({'id': element!});
    }

    // print(jsonObject);

    // String jsonData = jsonEncode(jsonObject);
    // print(jsonData);

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${MyURL.token}'
      };

      http.Request request =
          http.Request('POST', Uri.parse('${MyURL.url}teachers/assignments'));

      var requestBody = {
        "sections": jsonObject,
        "title": title,
        "content": content,
        "due_date": deadLine,
        "type": type,
      };

      request.body = jsonEncode(requestBody);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
      } else if (response.statusCode == 401) {
        print('postAttendanceStudents in statusCode:');
        print(response.reasonPhrase);
      } else {
        MySnackBar.showSnackBar(message: 'Check your internet connection');
      }
    } catch (error) {
      MySnackBar.showSnackBar(message: 'Check your internet connection');

      print('postAttendanceStudents in catch:');
      print(error);
    }
  }

  static Future<void> postMarks(
      String studentId, String score, String courseId, String type) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${MyURL.url}teachers/students/$studentId/marks'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${MyURL.token}'
        },
        body: jsonEncode(<String, String>{
          'course_id': courseId,
          'score': score,
          'type': type,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var res = jsonDecode(response.body);
        MySnackBar.showSnackBar(message: res['message']);
      } else if (response.statusCode == 400) {
        var res = jsonDecode(response.body);
        MySnackBar.showSnackBar(message: res['message']);
        print('postMarks Funtion:');
        print(response);
      } else {
        MySnackBar.showSnackBar(message: 'Check your internet connection');
      }
    } catch (error) {
      MySnackBar.showSnackBar(message: 'Check your internet connection');

      print('postMarks Funtion:');
      print(error);
    }
    return;
  }

  // post images to back
  static Future<void> postImagesInPost(String title, String content,
      String type, String gradeId, List<File> images) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${MyURL.token}'
      };
      http.MultipartRequest request = http.MultipartRequest(
          'POST', Uri.parse('${MyURL.url}teachers/posts'));

      request.fields.addAll({
        'title': title,
        'content': content,
        'type': type,
        'grade_id': gradeId,
      });
      // request.files.add(await http.MultipartFile.fromPath('image', image.path));

      for (var image in images) {
        http.MultipartFile file =
            await http.MultipartFile.fromPath('files[]', image.path);
        request.files.add(file);
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
        print(await response.stream.bytesToString());

        return;
      }
      if (response.statusCode == 401) {
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
        print('postImagesInPost Funtion in StatusCode :');
        print(await response.stream.bytesToString());

        return;
      } else {
        MySnackBar.showSnackBar(message: 'Check your internet connection');
        print('postImagesInPost Funtion:');
        print(response.reasonPhrase);
      }
    } catch (error) {
      MySnackBar.showSnackBar(message: 'Check your internet connection');

      print('postImagesInPost Funtion in catch :');
      print(error);
    }
  }

  static Future<void> postattendanceteachers(List<AttendanceModel> list) async {
    List<Attended> jsonList = list.map((student) {
      return Attended(
        id: student.id,
        attended: student.isAttendanceToday,
      );
    }).toList();
    // print(jsonList);

    TeachersPostAttendedModel jsonObject =
        TeachersPostAttendedModel(teachers: jsonList);
    // print(jsonObject);

    String jsonData = jsonEncode(jsonObject.toJson());
    // print(jsonData);

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${MyURL.token}'
      };

      var request = http.Request(
          'POST', Uri.parse('${MyURL.url}teachers/teachers-attendance'));
      request.body = jsonData;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
        // print(messageInSncak);
      } else if (response.statusCode == 401) {
        MySnackBar.showSnackBar(message: 'Check your internet connection');
        print('postattendanceteachers in statusCode:');
        print(response.reasonPhrase);
      } else {
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
      }
    } catch (error) {
      MySnackBar.showSnackBar(message: 'Check your internet connection');

      print('postattendanceteachers in catch:');
      print(error);
    }
  }

  static Future<void> postteacherreport(
      String studentID, String title, String content) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${MyURL.url}teachers/alerts'));
      request.fields.addAll({
        'student_id': studentID,
        'title': title,
        'content': content,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print(error);
    }
  }

  // static Future<void> postsplashscreen() async {
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse('${MyURL.url}'),
  //       headers: {
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer ${MyURL.token}'
  //       },
  //       // body: jsonEncode(<String, String>{
  //       //   'course_id': 'courseId',
  //       //   'score': 'score',
  //       //   'type': 'type',
  //       // }),
  //     );
  //     if (response.statusCode == 200) {
  //       var res = jsonDecode(response.body);

  //       GetStorage().write('token', res["token"]);
  //       GetStorage().write('is_principle', res["is_principle"]);

  //       MyURL.token = res["token"];

  //       print(GetStorage().read('token'));
  //       print(GetStorage().read('is_principle'));

  //       MySnackBar.showSnackBar(message: res['message']);

  //       if (res["is_principle"]) {
  //         Get.off(const PrincipleBottomBar());
  //       } else {
  //         Get.off(const BottomBar());
  //       }

  //       print(response.body);
  //       return;
  //     } else {
  //       print(response.body);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  static Future<void> postlogout() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MyURL.token}'
      };
      var request =
          http.Request('POST', Uri.parse('${MyURL.url}teachers/logout'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print('----');
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
        GetStorage().remove('token');
        Get.offAll(const Login());
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print(error);
    }
  }

  static Future<bool> postDelete(String id) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${MyURL.token}'
      };
      var request =
          http.Request('DELETE', Uri.parse('${MyURL.url}teachers/posts/$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
        print(await response.stream.bytesToString());
        return true;
      } else {
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(message: messageInSncak);
        print(response.reasonPhrase);
        return false;
      }
    } catch (error) {
      return false;
      print(error);
    }
  }
}
