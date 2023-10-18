import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/schedule_model.dart';
import 'my_url.dart';

class RestAPIPost {
  static Future<List<MyScheduleModel>> getschedule(String day) async {
    List<MyScheduleModel> lsm = [];
    try {
      http.Response response = await http
          .get(Uri.parse('${MyURL.url}teachers/schedule?day=$day'), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${MyURL.token}'
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log('-------------');
        // var res = ;
        log(response.body);
        lsm.addAll(ListScheduleModel.fromJson(jsonDecode(response.body))
            .scheduleModel!);
        // log(res1);
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
        log('getschedule Funtion:');
        log(response as String);
      }
    } catch (error) {
      log('getschedule Funtion:');
      log(error as String);
    }
    return [];
  }
}
