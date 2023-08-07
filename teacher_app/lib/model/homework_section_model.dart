class HomeworkSectionsModel {
  List<Sections>? sections;

  HomeworkSectionsModel({this.sections});

  HomeworkSectionsModel.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
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

class Sections {
  int? id;
  bool? isSelected;

  Sections({this.id, this.isSelected});

  Sections.fromJson(Map<String, dynamic> json) {
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
