class ShowPostsModel {
  bool? status;
  String? message;
  List<PostsToShow>? posts;

  ShowPostsModel({this.status, this.message, this.posts});

  ShowPostsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['posts'] != null) {
      posts = <PostsToShow>[];
      json['posts'].forEach((v) {
        posts!.add(PostsToShow.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostsToShow {
  int? id;
  int? teacherId;
  int? gradeId;
  String? title;
  String? content;
  String? type;
  String? elapsedTime;
  TeacherInPosts? teacher;
  List<Attachments>? attachments;

  PostsToShow({
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

  PostsToShow.fromJson(Map<String, dynamic> json) {
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
  String? username;
  String? firstName;
  String? lastName;
  String? imageUrl;
  String? bio;
  String? dateOfBirth;
  int? isPrinciple;
  String? gender;
  Course? course;

  TeacherInPosts(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.imageUrl,
      this.bio,
      this.dateOfBirth,
      this.isPrinciple,
      this.gender,
      this.course});

  TeacherInPosts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    imageUrl = json['image_url'];
    bio = json['bio'];
    dateOfBirth = json['date_of_birth'];
    isPrinciple = json['is_principle'];
    gender = json['gender'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image_url'] = imageUrl;
    data['bio'] = bio;
    data['date_of_birth'] = dateOfBirth;
    data['is_principle'] = isPrinciple;
    data['gender'] = gender;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    return data;
  }
}

class Course {
  int? id;
  String? name;

  Course({this.id, this.name});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Attachments {
  int? id;
  int? postId;
  String? fileUrl;
  String? type;

  Attachments({this.id, this.postId, this.fileUrl, this.type});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    fileUrl = json['file_url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['file_url'] = fileUrl;
    data['type'] = type;
    return data;
  }
}
