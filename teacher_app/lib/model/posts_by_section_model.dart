class PostsBySections {
  String? message;
  List<PostsTS>? data;

  PostsBySections({this.message, this.data});

  PostsBySections.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <PostsTS>[];
      json['data'].forEach((v) {
        data!.add(PostsTS.fromJson(v));
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

class PostsTS {
  int? id;
  int? teacherId;
  int? gradeId;
  String? title;
  String? content;
  String? type;
  String? elapsedTime;
  TeacherInPosts? teacher;
  List<Attachments>? attachments;

  PostsTS({
    this.id,
    this.teacherId,
    this.gradeId,
    this.title,
    this.content,
    this.type,
    this.elapsedTime,
    this.teacher,
    this.attachments,
  });

  PostsTS.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    gradeId = json['grade_id'];
    title = json['title'];
    content = json['content'];
    type = json['type'];
    elapsedTime = json['elapsed_time'];
    teacher = json['teacher'] != null
        ? TeacherInPosts.fromJson(json['teacher'])
        : null;
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teacher_id'] = teacherId;
    data['grade_id'] = gradeId;
    data['title'] = title;
    data['content'] = content;
    data['type'] = type;
    data['elapsed_time'] = elapsedTime;
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    if (attachments != null) {
      data['attachments'] = attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeacherInPosts {
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
  Course? course;

  TeacherInPosts({
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
    this.course,
  });

  TeacherInPosts.fromJson(Map<String, dynamic> json) {
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
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
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
    if (course != null) {
      data['course'] = course!.toJson();
    }
    return data;
  }
}

class Course {
  int? id;
  String? name;
  String? description;
  String? imagePath;

  Course({this.id, this.name, this.description, this.imagePath});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image_path'] = imagePath;
    return data;
  }
}

class Attachments {
  int? id;
  int? postId;
  String? fileUrl;
  String? type;
  String? createdAt;
  String? updatedAt;

  Attachments(
      {this.id,
      this.postId,
      this.fileUrl,
      this.type,
      this.createdAt,
      this.updatedAt});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    fileUrl = json['file_url'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['file_url'] = fileUrl;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
