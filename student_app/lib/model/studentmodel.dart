
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['grade_id'] = this.gradeId;
    data['section_id'] = this.sectionId;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['bio'] = this.bio;
    data['image_url'] = this.imageUrl;
    data['gender'] = this.gender;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
