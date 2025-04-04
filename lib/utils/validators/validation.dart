
class EValidator {

  static String? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty){
      return '$fieldName is required.';
    }

    return null;
  }



  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
  List<String> errors = [];

  if (value == null || value.isEmpty) {
    errors.add('Password is required.');
  } else {
    if (value.length < 6) {
      errors.add('At least 6 characters.');
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      errors.add('At least one uppercase letter.');
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      errors.add('At least one number.');
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      errors.add('At least one special character.');
    }
  }

  return errors.isEmpty ? null : errors.join('\n'); 
}

  static String? validatePhoneNumber(String? value) {
    List<String> errors = [];
    if (value == null || value.isEmpty) {
      errors.add('Phone number is required.');
     
    }
    else{

    final phoneRegExp = RegExp(r'^\d{10}$');
      if (!phoneRegExp.hasMatch(value)) {
        errors.add('Invalid phone number format (10 digits required).');
    }

    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)

    
    return errors.isEmpty? null : errors.join('\n');
  }

}
