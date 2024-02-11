class Days {
  static final DateTime today = DateTime.now();
  static final List<int> weekend = [DateTime.friday, DateTime.saturday];

  static final DateTime firstDay =
      DateTime(today.year, today.month - 3, today.day);
  static final DateTime lastDay =
      DateTime(today.year, today.month + 3, today.day);
}
