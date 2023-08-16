class TeachersModel {
  String? message;
  List<Teacher>? data;

  TeachersModel({this.message, this.data});

  TeachersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Teacher>[];
      json['data'].forEach((v) {
        data!.add(Teacher.fromJson(v));
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

class Teacher {
  int? id;
  int? courseId;
  String? username;
  String? firstName;
  String? lastName;
  String? address;
  String? phoneNumber;
  String? imageUrl;
  String? bio;
  String? dateOfBirth;
  int? isPrinciple;
  String? gender;
  String? createdAt;
  String? updatedAt;

  Teacher({
    this.id,
    this.courseId,
    this.username,
    this.firstName,
    this.lastName,
    this.address,
    this.phoneNumber,
    this.imageUrl,
    this.bio,
    this.dateOfBirth,
    this.isPrinciple,
    this.gender,
    this.createdAt,
    this.updatedAt,
  });

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    imageUrl = json['image_url'];
    bio = json['bio'];
    dateOfBirth = json['date_of_birth'];
    isPrinciple = json['is_principle'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_id'] = courseId;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['image_url'] = imageUrl;
    data['bio'] = bio;
    data['date_of_birth'] = dateOfBirth;
    data['is_principle'] = isPrinciple;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
