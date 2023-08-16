class StudentProfileModel {
  bool? status;
  String? message;
  StudentProfile? profile;
  StudentSection? section;
  StudentGrade? grade;

  StudentProfileModel(
      {this.status, this.message, this.profile, this.section, this.grade});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    profile = json['profile'] != null
        ? StudentProfile.fromJson(json['profile'])
        : null;
    section = json['section'] != null
        ? StudentSection.fromJson(json['section'])
        : null;
    grade = json['grade'] != null ? StudentGrade.fromJson(json['grade']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    if (section != null) {
      data['section'] = section!.toJson();
    }
    if (grade != null) {
      data['grade'] = grade!.toJson();
    }
    return data;
  }
}

class StudentProfile {
  int? id;
  int? gradeId;
  int? sectionId;
  String? username;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dateOfBirth;
  String? address;
  String? phoneNumber;
  String? bio;
  String? imageUrl;
  String? gender;
  String? type;
  String? createdAt;
  String? updatedAt;

  StudentProfile({
    this.id,
    this.gradeId,
    this.sectionId,
    this.username,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dateOfBirth,
    this.address,
    this.phoneNumber,
    this.bio,
    this.imageUrl,
    this.gender,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  StudentProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gradeId = json['grade_id'];
    sectionId = json['section_id'];
    username = json['username'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    bio = json['bio'];
    imageUrl = json['image_url'];
    gender = json['gender'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['grade_id'] = gradeId;
    data['section_id'] = sectionId;
    data['username'] = username;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['date_of_birth'] = dateOfBirth;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['bio'] = bio;
    data['image_url'] = imageUrl;
    data['gender'] = gender;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class StudentSection {
  int? id;
  int? gradeId;
  int? number;
  String? name;

  StudentSection({this.id, this.gradeId, this.number, this.name});

  StudentSection.fromJson(Map<String, dynamic> json) {
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

class StudentGrade {
  int? id;
  int? number;
  String? name;
  String? type;

  StudentGrade({this.id, this.number, this.name, this.type});

  StudentGrade.fromJson(Map<String, dynamic> json) {
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
