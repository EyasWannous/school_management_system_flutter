class StudentAttendanceModel {
  final int id;
  final int numberOfDays;
  final String name;
  final String imageUrl;
  bool isAttendanceToday;

  StudentAttendanceModel({
    required this.id,
    required this.numberOfDays,
    required this.name,
    required this.imageUrl,
    required this.isAttendanceToday,
  });
}
