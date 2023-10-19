extension StringValidator on String {
  /// The function checks if a given string is a valid email address using a regular expression.
  ///
  /// Returns:
  ///   The function `isValidEmail()` returns a boolean value indicating whether the given string matches the pattern of a
  /// valid email address.
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  /// The function checks if a password is valid based on its length.
  ///
  /// Returns:
  ///   a boolean value, which indicates whether the password is valid or not.
  bool isValidPassword() {
    return length > 3;
  }
}
