class AssignModel {
  int? id;
  int? sectionId;
  int? teacherId;
  Null? gradeCourseId;
  String? title;
  String? content;
  String? dueDate;
  String? type;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  AssignModel(
      {this.id,
      this.sectionId,
      this.teacherId,
      this.gradeCourseId,
      this.title,
      this.content,
      this.dueDate,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  AssignModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    teacherId = json['teacher_id'];
    gradeCourseId = json['grade_course_id'];
    title = json['title'];
    content = json['content'];
    dueDate = json['due_date'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['section_id'] = sectionId;
    data['teacher_id'] = teacherId;
    data['grade_course_id'] = gradeCourseId;
    data['title'] = title;
    data['content'] = content;
    data['due_date'] = dueDate;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? studentId;
  int? assignmentId;

  Pivot({this.studentId, this.assignmentId});

  Pivot.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    assignmentId = json['assignment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_id'] = studentId;
    data['assignment_id'] = assignmentId;
    return data;
  }
}
