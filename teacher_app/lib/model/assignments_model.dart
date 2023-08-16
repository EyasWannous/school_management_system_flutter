class AssignmentsModel {
  String? message;
  List<AssignmentsToShow>? data;

  AssignmentsModel({this.message, this.data});

  AssignmentsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <AssignmentsToShow>[];
      json['data'].forEach((v) {
        data!.add(AssignmentsToShow.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  String? createdAt;
  String? updatedAt;

  AssignmentsToShow({
    this.id,
    this.sectionId,
    this.teacherId,
    this.title,
    this.content,
    this.dueDate,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  AssignmentsToShow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    teacherId = json['teacher_id'];
    title = json['title'];
    content = json['content'];
    dueDate = json['due_date'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
