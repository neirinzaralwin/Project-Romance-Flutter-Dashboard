extension IntExtension on dynamic {
  String comma() {
    return toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=\d{3})'), (Match m) => '${m[1]},');
  }
}
