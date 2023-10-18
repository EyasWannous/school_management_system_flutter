class AboutSubModel {
  Teacher? teacher;
  About? about;

  AboutSubModel({this.teacher, this.about});

  AboutSubModel.fromJson(Map<String, dynamic> json) {
    teacher =
        json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
    about = json['about'] != null ? About.fromJson(json['about']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    if (about != null) {
      data['about'] = about!.toJson();
    }
    return data;
  }
}

class Teacher {
  int? id;
  String? firstName;
  String? lastName;
  Pivot? pivot;

  Teacher({this.id, this.firstName, this.lastName, this.pivot});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? sectionId;
  int? teacherId;

  Pivot({this.sectionId, this.teacherId});

  Pivot.fromJson(Map<String, dynamic> json) {
    sectionId = json['section_id'];
    teacherId = json['teacher_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section_id'] = sectionId;
    data['teacher_id'] = teacherId;
    return data;
  }
}

class About {
  int? id;
  int? gradeId;
  int? courseId;
  String? description;
  int? numberOfWeeklyClasses;
  int? topMark;
  int? lowerMark;

  About(
      {this.id,
      this.gradeId,
      this.courseId,
      this.description,
      this.numberOfWeeklyClasses,
      this.topMark,
      this.lowerMark});

  About.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gradeId = json['grade_id'];
    courseId = json['course_id'];
    description = json['description'];
    numberOfWeeklyClasses = json['number of weekly classes'];
    topMark = json['top_mark'];
    lowerMark = json['lower_mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['grade_id'] = gradeId;
    data['course_id'] = courseId;
    data['description'] = description;
    data['number of weekly classes'] = numberOfWeeklyClasses;
    data['top_mark'] = topMark;
    data['lower_mark'] = lowerMark;
    return data;
  }
}
