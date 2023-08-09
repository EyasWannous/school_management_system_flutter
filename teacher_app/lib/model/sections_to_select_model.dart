class SectionToSelectModel {
  int? id;
  int? gradeId;
  int? number;
  String? name;
  bool? isSelected;

  SectionToSelectModel(
      {this.id, this.gradeId, this.number, this.name, this.isSelected});

  SectionToSelectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gradeId = json['grade_id'];
    number = json['number'];
    name = json['name'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['grade_id'] = gradeId;
    data['number'] = number;
    data['name'] = name;
    data['isSelected'] = isSelected;
    return data;
  }
}
