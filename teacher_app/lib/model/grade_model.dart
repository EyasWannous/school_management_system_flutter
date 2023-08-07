class GradeModel {
  String? message;
  List<Grade>? data;

  GradeModel({this.message, this.data});

  GradeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Grade>[];
      json['data'].forEach((v) {
        data!.add(Grade.fromJson(v));
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

class Grade {
  int? id;
  int? number;
  String? name;
  String? type;

  Grade({this.id, this.number, this.name, this.type});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}
