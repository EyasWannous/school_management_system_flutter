class TeacherProfileModel {
  bool? status;
  Profile? profile;

  TeacherProfileModel({this.status, this.profile});

  TeacherProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
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

  Profile({
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
  });

  Profile.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
