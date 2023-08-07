class StudentsPostAttendedModel {
  List<StudentAttended>? students;

  StudentsPostAttendedModel({this.students});

  StudentsPostAttendedModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <StudentAttended>[];
      json['students'].forEach((v) {
        students!.add(StudentAttended.fromJson(v));
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

class StudentAttended {
  int? id;
  bool? attended;

  StudentAttended({this.id, this.attended});

  StudentAttended.fromJson(Map<String, dynamic> json) {
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
