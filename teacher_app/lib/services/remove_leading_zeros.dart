class RemoveLeadingZeros {
  static String removeLeadingZeros(String toRemove) {
    return toRemove.replaceAll(RegExp(r'^0+'), '');
  }
}
