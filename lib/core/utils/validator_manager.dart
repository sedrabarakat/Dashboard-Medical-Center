class ValidatorManager {
  static final ValidatorManager _instance = ValidatorManager._internal();
  static ValidatorManager get instance => _instance;
  ValidatorManager._internal();
  factory ValidatorManager() {
    return _instance;
  }

  final RegularExpressions regExp = RegularExpressions();

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter First name';
    }
    return null;
  }

  String? validateMiddleName(String value) {
    if (value.isEmpty) {
      return 'Please enter Middle name';
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Please enter Last name';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter email';
    }
    if (!regExp.emailRegex.hasMatch(value)) {
      return 'Please enter  email';
    }
    return null;
  }

  String? validatePhone(String value) {
    const int minLength=10;
    if (value.isEmpty) {
      return 'Please enter phone number';
    }
    if (value.length<minLength) {
      return 'Please enter a valid $minLength-digit phone number';
    }
    return null;
  }

  String? validatePassword(String value) {

    const int minLength=8;

    if (value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long';
    }

    return null;
  }

  String? validateConfirmPassword(String value, String originalPassword) {
    // Check if the input is empty
    if (value.isEmpty) {
      return 'Please enter your password again';
    }

    // Check if the passwords match
    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    // Passwords match
    return null;
  }

  String? validate_EmptyState(String value,String phrase) {
    if (value.isEmpty) {
      return 'Please enter $phrase';
    }
    return null;
  }

  String? validateChildren(String value) {
    if (value.isEmpty) {
      return 'Please enter Children Number';
    }
    if(int.parse(value)<0)
      return 'Please enter valid Number';
    return null;
  }

}

class RegularExpressions {
  ///Email
  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );

  ///Phone
  final RegExp phoneRegex = RegExp(r'^\d{10}$');

  ///Password
  final RegExp upperCaseRegex = RegExp(r'[A-Z]');
  final RegExp lowerCaseRegex = RegExp(r'[a-z]');
  final RegExp digitRegex = RegExp(r'[0-9]');
  final RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
}
