class AttendanceModel {
  final int id;
  final int numberOfDays;
  final String name;
  final String imageUrl;
  bool isAttendanceToday;

  AttendanceModel({
    required this.id,
    required this.numberOfDays,
    required this.name,
    required this.imageUrl,
    required this.isAttendanceToday,
  });
}
