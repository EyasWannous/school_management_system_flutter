class MarkSubFModel {
  int? id;
  int? studentId;
  int? gradeCourseId;
  String? type;
  int? score;
  String? year;
  String? term;
  String? createdAt;
  String? updatedAt;

  MarkSubFModel(
      {this.id,
      this.studentId,
      this.gradeCourseId,
      this.type,
      this.score,
      this.year,
      this.term,
      this.createdAt,
      this.updatedAt});

  MarkSubFModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    gradeCourseId = json['grade_course_id'];
    type = json['type'];
    score = json['score'];
    year = json['year'];
    term = json['term'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class MarkSubSModel {
  int? id;
  int? studentId;
  int? gradeCourseId;
  String? type;
  int? score;
  String? year;
  String? term;
  String? createdAt;
  String? updatedAt;

  MarkSubSModel(
      {this.id,
      this.studentId,
      this.gradeCourseId,
      this.type,
      this.score,
      this.year,
      this.term,
      this.createdAt,
      this.updatedAt});

  MarkSubSModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    gradeCourseId = json['grade_course_id'];
    type = json['type'];
    score = json['score'];
    year = json['year'];
    term = json['term'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
