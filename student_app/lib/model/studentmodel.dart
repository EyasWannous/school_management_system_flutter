import 'package:flutter/material.dart';

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

  StudentProfile(
      {this.id,
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
      this.updatedAt});

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
