class Days {
  static final DateTime today = DateTime.now();
  static final DateTime firstDay =
      DateTime(today.year, today.month - 3, today.day);
  static final DateTime lastDay =
      DateTime(today.year, today.month + 3, today.day);
}
