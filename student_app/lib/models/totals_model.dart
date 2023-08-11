class ShowTotalsModel {
  bool? status;
  String? message;
  List<Totals>? totals;

  ShowTotalsModel({this.status, this.message, this.totals});

  ShowTotalsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['totals'] != null) {
      totals = <Totals>[];
      json['totals'].forEach((v) {
        totals!.add(Totals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (totals != null) {
      data['totals'] = totals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Totals {
  int? id;
  int? studentId;
  int? gradeCourseId;
  String? year;
  int? firstTermScore;
  int? secondTermScore;
  int? finalScore;
  int? hasFailed;
  String? courseName;
  GradeCourse? gradeCourse;

  Totals(
      {this.id,
      this.studentId,
      this.gradeCourseId,
      this.year,
      this.firstTermScore,
      this.secondTermScore,
      this.finalScore,
      this.hasFailed,
      this.courseName,
      this.gradeCourse});

  Totals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    gradeCourseId = json['grade_course_id'];
    year = json['year'];
    firstTermScore = json['first_term_score'];
    secondTermScore = json['second_term_score'];
    finalScore = json['final_score'];
    hasFailed = json['has_failed'];
    courseName = json['course_name'];
    gradeCourse = json['grade_course'] != null
        ? GradeCourse.fromJson(json['grade_course'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_id'] = studentId;
    data['grade_course_id'] = gradeCourseId;
    data['year'] = year;
    data['first_term_score'] = firstTermScore;
    data['second_term_score'] = secondTermScore;
    data['final_score'] = finalScore;
    data['has_failed'] = hasFailed;
    data['course_name'] = courseName;
    if (gradeCourse != null) {
      data['grade_course'] = gradeCourse!.toJson();
    }
    return data;
  }
}

class GradeCourse {
  int? id;
  int? gradeId;
  int? courseId;
  String? description;
  int? numberOfWeeklyClasses;
  int? topMark;
  int? lowerMark;

  GradeCourse(
      {this.id,
      this.gradeId,
      this.courseId,
      this.description,
      this.numberOfWeeklyClasses,
      this.topMark,
      this.lowerMark});

  GradeCourse.fromJson(Map<String, dynamic> json) {
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
