class StudentsModel {
  String? message;
  List<Student>? data;

  StudentsModel({this.message, this.data});

  StudentsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Student>[];
      json['data'].forEach((v) {
        data!.add(Student.fromJson(v));
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

class Student {
  int? id;
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
  int? absence;

  Student({
    this.id,
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
    this.absence,
  });

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    absence = json['absence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
    data['absence'] = absence;
    return data;
  }
}
