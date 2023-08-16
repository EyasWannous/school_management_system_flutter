class HomeworkSectionsModel {
  List<SectionsHomeworkModel>? sections;

  HomeworkSectionsModel({this.sections});

  HomeworkSectionsModel.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <SectionsHomeworkModel>[];
      json['sections'].forEach((v) {
        sections!.add(SectionsHomeworkModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SectionsHomeworkModel {
  int? id;
  bool? isSelected;
  String? numberOfSection;
  String? name;

  SectionsHomeworkModel(
      {this.id, this.isSelected, this.numberOfSection, this.name});

  SectionsHomeworkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isSelected'] = isSelected;
    return data;
  }
}
