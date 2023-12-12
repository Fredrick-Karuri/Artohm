/// Checks if string consist only Alphabet. (No Whitespace)
String? isText(String? inputString, {bool isRequired = false}) {
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    return null;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z\s]+$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(inputString)) {
      return 'Name must contain only letters and spaces';
    }
  }

  return null;
}


/// Checks if string is email.
String? isValidEmail(String? inputString, {bool isRequired = false}) {
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    return null;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(inputString)) {
      if (!inputString.contains('@')) {
        return 'Email must contain @';
      } else if (!inputString.contains('.')) {
        return 'Email must contain a domain';
      } else {
        return 'Please enter a valid email';
      }
    }
  }

  return null;
}


String? isValidPassword(String? inputString, {bool isRequired = false}) {
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    return null;
  }

  if (inputString != null && inputString.isNotEmpty) {
    if (inputString.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(inputString)) {
      return 'Password must contain at least one upper case letter';
    } else if (!RegExp(r'^(?=.*?[a-z])').hasMatch(inputString)) {
      return 'Password must contain at least one lower case letter';
    } else if (!RegExp(r'^(?=.*?[\d])').hasMatch(inputString)) {
      return 'Password must contain at least one digit';
    } else if (!RegExp(r'^(?=.*?[\\@\\#\\$\\%\\^\\&\\+\\=])')
        .hasMatch(inputString)) {
      return r'Password must contain at least one special character [@#$%^&+=]';
    } else if (RegExp(r'^(?=.*?\s)').hasMatch(inputString)) {
      return 'Password must not contain white space';
    }
  }

  return null;
}



