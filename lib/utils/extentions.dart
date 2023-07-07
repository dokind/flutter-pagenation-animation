extension StringPhoneNumberValidator on String {
  bool isPhoneNumber() {
    const phoneRegex =
        r'^\+?\d{1,3}?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$';
    final RegExp regex = RegExp(phoneRegex);
    final isMatch = regex.hasMatch(this);

    if (isMatch && this.length == 8) {
      // Additional check for 8-digit phone numbers in Mongolia
      return true;
    }

    return false;
  }

  bool isStrongPassword() {
    return true;
  }
}
