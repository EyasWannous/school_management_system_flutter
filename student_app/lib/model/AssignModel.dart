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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['section_id'] = this.sectionId;
    data['teacher_id'] = this.teacherId;
    data['grade_course_id'] = this.gradeCourseId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['due_date'] = this.dueDate;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['assignment_id'] = this.assignmentId;
    return data;
  }
}
