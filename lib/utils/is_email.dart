bool isEmail(String input) {
  // Regular expression pattern for checking email validity
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$');

  return emailRegex.hasMatch(input);
}