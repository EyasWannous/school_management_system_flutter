class LeadingZeros {
  static String remove(String toRemove) {
    return toRemove.replaceAll(RegExp(r'^0+'), '');
  }
}
