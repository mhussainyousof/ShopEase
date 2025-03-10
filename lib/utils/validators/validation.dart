/// A utility class for validating user inputs such as email, password, and phone numbers.
class EValidator {

  /// Validates an email address.
  /// Returns an error message if invalid, otherwise returns null.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    );

    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Validates a password with the following rules:
  /// - Minimum 8 characters
  /// - At least one uppercase letter
  /// - At least one lowercase letter
  /// - At least one number
  /// - At least one special character (! @ # $ & * ~)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Password must contain at least one special character (! @ # \$ & * ~)';
    }

    return null;
  }

  /// Validates an international phone number based on E.164 standard.
  /// Accepts phone numbers with or without a leading '+' and a length between 7 and 15 digits.
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    value = value.trim();

    final phoneRegExp = RegExp(r'^\+?[0-9]{7,15}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Enter a valid international phone number (e.g., +12345678901)';
    }

    return null;
  }
}


