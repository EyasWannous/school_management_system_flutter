class AssignmentsModel {
  bool? status;
  String? message;
  List<AssignmentsToShow>? assignments;

  AssignmentsModel({this.status, this.message, this.assignments});

  AssignmentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['assignments'] != null) {
      assignments = <AssignmentsToShow>[];
      json['assignments'].forEach((v) {
        assignments!.add(AssignmentsToShow.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (assignments != null) {
      data['assignments'] = assignments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssignmentsToShow {
  int? id;
  int? sectionId;
  int? teacherId;
  String? title;
  String? content;
  String? dueDate;
  String? type;
  Pivot? pivot;

  AssignmentsToShow(
      {this.id,
      this.sectionId,
      this.teacherId,
      this.title,
      this.content,
      this.dueDate,
      this.type,
      this.pivot});

  AssignmentsToShow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    teacherId = json['teacher_id'];
    title = json['title'];
    content = json['content'];
    dueDate = json['due_date'];
    type = json['type'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['section_id'] = sectionId;
    data['teacher_id'] = teacherId;
    data['title'] = title;
    data['content'] = content;
    data['due_date'] = dueDate;
    data['type'] = type;
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
