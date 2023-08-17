class ScheduleModel {
  int? id;
  int? sectionId;
  int? gradeCourseId;
  int? order;
  String? startAt;
  String? endAt;
  String? day;
  String? createdAt;
  String? updatedAt;

  ScheduleModel(
      {this.id,
      this.sectionId,
      this.gradeCourseId,
      this.order,
      this.startAt,
      this.endAt,
      this.day,
      this.createdAt,
      this.updatedAt});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    gradeCourseId = json['grade_course_id'];
    order = json['order'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    day = json['day'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['section_id'] = sectionId;
    data['grade_course_id'] = gradeCourseId;
    data['order'] = order;
    data['start_at'] = startAt;
    data['end_at'] = endAt;
    data['day'] = day;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
