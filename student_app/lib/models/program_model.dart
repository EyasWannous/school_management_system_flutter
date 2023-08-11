class ProgramModel {
  List<Sunday>? sunday;
  List<Tuesday>? tuesday;
  List<Thursday>? thursday;
  List<Wednesday>? wednesday;
  List<Monday>? monday;

  ProgramModel(
      {this.sunday, this.tuesday, this.thursday, this.wednesday, this.monday});

  ProgramModel.fromJson(Map<String, dynamic> json) {
    if (json['sunday'] != null) {
      sunday = <Sunday>[];
      json['sunday'].forEach((v) {
        sunday!.add(Sunday.fromJson(v));
      });
    }
    if (json['tuesday'] != null) {
      tuesday = <Tuesday>[];
      json['tuesday'].forEach((v) {
        tuesday!.add(Tuesday.fromJson(v));
      });
    }
    if (json['thursday'] != null) {
      thursday = <Thursday>[];
      json['thursday'].forEach((v) {
        thursday!.add(Thursday.fromJson(v));
      });
    }
    if (json['wednesday'] != null) {
      wednesday = <Wednesday>[];
      json['wednesday'].forEach((v) {
        wednesday!.add(Wednesday.fromJson(v));
      });
    }
    if (json['monday'] != null) {
      monday = <Monday>[];
      json['monday'].forEach((v) {
        monday!.add(Monday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sunday != null) {
      data['sunday'] = sunday!.map((v) => v.toJson()).toList();
    }
    if (tuesday != null) {
      data['tuesday'] = tuesday!.map((v) => v.toJson()).toList();
    }
    if (thursday != null) {
      data['thursday'] = thursday!.map((v) => v.toJson()).toList();
    }
    if (wednesday != null) {
      data['wednesday'] = wednesday!.map((v) => v.toJson()).toList();
    }
    if (monday != null) {
      data['monday'] = monday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sunday {
  int? id;
  int? sectionId;
  int? gradeCourseId;
  int? order;
  String? startAt;
  String? endAt;
  String? day;
  String? grade;
  String? courseName;
  String? section;

  Sunday({
    this.id,
    this.sectionId,
    this.gradeCourseId,
    this.order,
    this.startAt,
    this.endAt,
    this.day,
    this.grade,
    this.courseName,
    this.section,
  });

  Sunday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    gradeCourseId = json['grade_course_id'];
    order = json['order'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    day = json['day'];
    grade = json['grade'];
    courseName = json['course_name'];
    section = json['section'];
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
    data['grade'] = grade;
    data['course_name'] = courseName;
    data['section'] = section;

    return data;
  }
}

class Monday {
  int? id;
  int? sectionId;
  int? gradeCourseId;
  int? order;
  String? startAt;
  String? endAt;
  String? day;
  String? grade;
  String? courseName;
  String? section;

  Monday({
    this.id,
    this.sectionId,
    this.gradeCourseId,
    this.order,
    this.startAt,
    this.endAt,
    this.day,
    this.grade,
    this.courseName,
    this.section,
  });

  Monday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    gradeCourseId = json['grade_course_id'];
    order = json['order'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    day = json['day'];
    grade = json['grade'];
    courseName = json['course_name'];
    section = json['section'];
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
    data['grade'] = grade;
    data['course_name'] = courseName;
    data['section'] = section;

    return data;
  }
}

class Tuesday {
  int? id;
  int? sectionId;
  int? gradeCourseId;
  int? order;
  String? startAt;
  String? endAt;
  String? day;
  String? grade;
  String? courseName;
  String? section;

  Tuesday({
    this.id,
    this.sectionId,
    this.gradeCourseId,
    this.order,
    this.startAt,
    this.endAt,
    this.day,
    this.grade,
    this.courseName,
    this.section,
  });

  Tuesday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    gradeCourseId = json['grade_course_id'];
    order = json['order'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    day = json['day'];
    grade = json['grade'];
    courseName = json['course_name'];
    section = json['section'];
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
    data['grade'] = grade;
    data['course_name'] = courseName;
    data['section'] = section;

    return data;
  }
}

class Wednesday {
  int? id;
  int? sectionId;
  int? gradeCourseId;
  int? order;
  String? startAt;
  String? endAt;
  String? day;
  String? grade;
  String? courseName;
  String? section;

  Wednesday({
    this.id,
    this.sectionId,
    this.gradeCourseId,
    this.order,
    this.startAt,
    this.endAt,
    this.day,
    this.grade,
    this.courseName,
    this.section,
  });

  Wednesday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    gradeCourseId = json['grade_course_id'];
    order = json['order'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    day = json['day'];
    grade = json['grade'];
    courseName = json['course_name'];
    section = json['section'];
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
    data['grade'] = grade;
    data['course_name'] = courseName;
    data['section'] = section;

    return data;
  }
}

class Thursday {
  int? id;
  int? sectionId;
  int? gradeCourseId;
  int? order;
  String? startAt;
  String? endAt;
  String? day;
  String? grade;
  String? courseName;
  String? section;

  Thursday({
    this.id,
    this.sectionId,
    this.gradeCourseId,
    this.order,
    this.startAt,
    this.endAt,
    this.day,
    this.grade,
    this.courseName,
    this.section,
  });

  Thursday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    gradeCourseId = json['grade_course_id'];
    order = json['order'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    day = json['day'];
    grade = json['grade'];
    courseName = json['course_name'];
    section = json['section'];
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
    data['grade'] = grade;
    data['course_name'] = courseName;
    data['section'] = section;

    return data;
  }
}
