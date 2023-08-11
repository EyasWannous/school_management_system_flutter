class MarkSubModel {
  bool? status;
  String? message;
  List<FirstTerm>? firstTerm;
  List<SecondTerm>? secondTerm;

  MarkSubModel({this.status, this.message, this.firstTerm, this.secondTerm});

  MarkSubModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['first_term'] != null) {
      firstTerm = <FirstTerm>[];
      json['first_term'].forEach((v) {
        firstTerm!.add(FirstTerm.fromJson(v));
      });
    }
    if (json['second_term'] != null) {
      secondTerm = <SecondTerm>[];
      json['second_term'].forEach((v) {
        secondTerm!.add(SecondTerm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (firstTerm != null) {
      data['first_term'] = firstTerm!.map((v) => v.toJson()).toList();
    }
    if (secondTerm != null) {
      data['second_term'] = secondTerm!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FirstTerm {
  int? id;
  int? studentId;
  int? gradeCourseId;
  String? type;
  int? score;
  String? year;
  String? term;

  FirstTerm({
    this.id,
    this.studentId,
    this.gradeCourseId,
    this.type,
    this.score,
    this.year,
    this.term,
  });

  FirstTerm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    gradeCourseId = json['grade_course_id'];
    type = json['type'];
    score = json['score'];
    year = json['year'];
    term = json['term'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_id'] = studentId;
    data['grade_course_id'] = gradeCourseId;
    data['type'] = type;
    data['score'] = score;
    data['year'] = year;
    data['term'] = term;
    return data;
  }
}

class SecondTerm {
  int? id;
  int? studentId;
  int? gradeCourseId;
  String? type;
  int? score;
  String? year;
  String? term;

  SecondTerm({
    this.id,
    this.studentId,
    this.gradeCourseId,
    this.type,
    this.score,
    this.year,
    this.term,
  });

  SecondTerm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    gradeCourseId = json['grade_course_id'];
    type = json['type'];
    score = json['score'];
    year = json['year'];
    term = json['term'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_id'] = studentId;
    data['grade_course_id'] = gradeCourseId;
    data['type'] = type;
    data['score'] = score;
    data['year'] = year;
    data['term'] = term;
    return data;
  }
}
