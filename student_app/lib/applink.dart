class AppLink {
  static const String server = 'http://192.168.1.104:9000';
// profile
  static const String profile = "$server/api/students/profile";

  //AboutSub
  static const String aboutsub = "$server/api/students/totals?year=2023";

//marksub
  static const String marksub =
      "$server/api/students/marks?course_id=6&year=2016";
//marks

  static const String marks = "$server/api/students/courses";

//courses
  static const String courses = "$server/api/students/courses";

//assign
  static const String assign = "$server/api/students/assignments?course_id=4";
//schedule
  static const String schedule = "$server/api/students/schedules";

  static const String Token = "1|mGI64brtqqrD9qstmR2WmjlaMjfXmYO1Dd5zDni1";
}
