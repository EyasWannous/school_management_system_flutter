class StudentsPostAttendedModel {
  List<Attended>? students;

  StudentsPostAttendedModel({this.students});

  StudentsPostAttendedModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Attended>[];
      json['students'].forEach((v) {
        students!.add(Attended.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeachersPostAttendedModel {
  List<Attended>? teachers;

  TeachersPostAttendedModel({this.teachers});

  TeachersPostAttendedModel.fromJson(Map<String, dynamic> json) {
    if (json['teachers'] != null) {
      teachers = <Attended>[];
      json['teachers'].forEach((v) {
        teachers!.add(Attended.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teachers != null) {
      data['teachers'] = teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attended {
  int? id;
  bool? attended;

  Attended({this.id, this.attended});

  Attended.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attended = json['attended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attended'] = attended;
    return data;
  }
}
