class ListScheduleModel {
  List<MyScheduleModel>? scheduleModel;

  ListScheduleModel({this.scheduleModel});

  ListScheduleModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      scheduleModel = <MyScheduleModel>[];
      json['data'].forEach((v) {
        scheduleModel!.add(MyScheduleModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (scheduleModel != null) {
      data['data'] = scheduleModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyScheduleModel {
  int? order;
  String? startAt;
  String? endAt;
  String? day;
  String? grade;
  String? courseName;
  String? section;

  MyScheduleModel({
    this.order,
    this.startAt,
    this.endAt,
    this.day,
    this.grade,
    this.courseName,
    this.section,
  });

  MyScheduleModel.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    day = json['day'];
    grade = json['grade'];
    courseName = json['course_name'];
    section = json['section'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['start_at'] = startAt;
    data['end_at'] = endAt;
    data['day'] = day;
    data['grade'] = grade;
    data['course_name'] = courseName;
    data['section'] = section;
    return data;
  }
}
