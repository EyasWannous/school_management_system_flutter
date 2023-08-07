class SectionsModel {
  String? message;
  List<Section>? data;

  SectionsModel({this.message, this.data});

  SectionsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Section>[];
      json['data'].forEach((v) {
        data!.add(Section.fromJson(v));
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

class Section {
  int? id;
  int? gradeId;
  int? number;
  String? name;

  Section({this.id, this.gradeId, this.number, this.name});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gradeId = json['grade_id'];
    number = json['number'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['grade_id'] = gradeId;
    data['number'] = number;
    data['name'] = name;
    return data;
  }
}
