class CoursesModel {
  int? id;
  String? name;
  String? description;
  Pivot? pivot;

  CoursesModel({this.id, this.name, this.description, this.pivot});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? gradeId;
  int? courseId;

  Pivot({this.gradeId, this.courseId});

  Pivot.fromJson(Map<String, dynamic> json) {
    gradeId = json['grade_id'];
    courseId = json['course_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grade_id'] = gradeId;
    data['course_id'] = courseId;
    return data;
  }
}
