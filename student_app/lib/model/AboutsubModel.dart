class AboutSubModel {
  Teacher? teacher;
  About? about;

  AboutSubModel({this.teacher, this.about});

  AboutSubModel.fromJson(Map<String, dynamic> json) {
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    about = json['about'] != null ? new About.fromJson(json['about']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    if (this.about != null) {
      data['about'] = this.about!.toJson();
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_id'] = this.sectionId;
    data['teacher_id'] = this.teacherId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['grade_id'] = this.gradeId;
    data['course_id'] = this.courseId;
    data['description'] = this.description;
    data['number of weekly classes'] = this.numberOfWeeklyClasses;
    data['top_mark'] = this.topMark;
    data['lower_mark'] = this.lowerMark;
    return data;
  }
}
