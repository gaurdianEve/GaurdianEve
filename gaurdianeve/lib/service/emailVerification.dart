bool validateEmail(String email) {
  // Regular expression pattern for validating email addresses
  final RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  if (regex.hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}
