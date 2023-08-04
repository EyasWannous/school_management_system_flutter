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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['section_id'] = this.sectionId;
    data['grade_course_id'] = this.gradeCourseId;
    data['order'] = this.order;
    data['start_at'] = this.startAt;
    data['end_at'] = this.endAt;
    data['day'] = this.day;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
