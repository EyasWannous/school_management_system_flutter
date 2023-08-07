class Event {
  final String title;
  final String content;
  final bool isHoliday;
  const Event({
    required this.title,
    required this.content,
    required this.isHoliday,
  });

  @override
  String toString() => title;
}
