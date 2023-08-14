class Event {
  final String title;
  final String content;
  final String time;
  final bool isHoliday;
  const Event({
    required this.title,
    required this.content,
    required this.time,
    required this.isHoliday,
  });

  @override
  String toString() => title;
}
