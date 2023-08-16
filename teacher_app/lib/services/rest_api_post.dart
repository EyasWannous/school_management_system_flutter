import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teacher_app/common/my_snackbar.dart';
import 'package:teacher_app/components/bottom_bar.dart';
import 'package:teacher_app/screen/homepage.dart';

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
        final box = GetStorage();

        // do logic here

        box.write('token', res["token"]);
        box.write('is_principle', res["is_principle"]);
        print(box.read('token'));
        print(box.read('is_principle'));
        Get.off(const BottomBar());
        return;
      } else if (response.statusCode == 400) {
        print('postlogin Funtion:');
        print(response);
      }
    } catch (error) {
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
        MySnackBar.showSnackBar(title: messageInSncak, message: messageInSncak);
        print(messageInSncak);
      } else if (response.statusCode == 401) {
        print('postAttendanceStudents in statusCode:');
        print(response.reasonPhrase);
      }
    } catch (error) {
      print('postAttendanceStudents in catch:');
      print(error);
    }
  }

  static Future<void> postHomework(List<SectionsHomeworkModel> list,
      String title, String content, String type, String deadLine) async {
    List<int?> jsonList = list.map((student) {
      if (student.isSelected!) return student.id!;
    }).toList();
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
        // print('postAttendanceStudents :');
        // print(await response.stream.bytesToString());
      } else if (response.statusCode == 401) {
        print('postAttendanceStudents in statusCode:');
        print(response.reasonPhrase);
      }
    } catch (error) {
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
        // var res = jsonDecode(response.body)['data'];
        // print('postMarks Funtion:');
        // print(res);
      } else if (response.statusCode == 400) {
        print('postMarks Funtion:');
        print(response);
      }
    } catch (error) {
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
        print(await response.stream.bytesToString());

        return;
      }
      if (response.statusCode == 401) {
        print('postImagesInPost Funtion in StatusCode :');
        print(await response.stream.bytesToString());

        return;
      } else {
        print('postImagesInPost Funtion:');
        print(response.reasonPhrase);
      }
    } catch (error) {
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
          'POST', Uri.parse('${MyURL.url}teachers/attendance-teachers'));
      request.body = jsonData;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        String messageInSncak =
            jsonDecode(await response.stream.bytesToString())['message'];
        MySnackBar.showSnackBar(title: messageInSncak, message: messageInSncak);
        // print(messageInSncak);
      } else if (response.statusCode == 401) {
        print('postattendanceteachers in statusCode:');
        print(response.reasonPhrase);
      }
    } catch (error) {
      print('postattendanceteachers in catch:');
      print(error);
    }
  }
}
