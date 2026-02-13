class AppValidators {
  // Name
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'nameRequired';
    }
    if (value.trim().length < 3) {
      return 'nameMinLength';
    }
    return null;
  }

  // Email
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'emailRequired';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'invalidEmail';
    }
    return null;
  }

  // Password
  static List<String>? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ['passwordRequired'];
    }

    if (value.length < 8) {
      return ['passwordMinLength'];
    }

    final errors = <String>[];

    if (!value.contains(RegExp(r'[A-Z]'))) {
      errors.add('passwordUppercase');
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      errors.add('passwordLowercase');
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      errors.add('passwordNumber');
    }
    if (!value.contains(RegExp(r'[!@#\$%\^&\*\(\)_\+\-=\?]'))) {
      errors.add('passwordSpecial');
    }

    return errors.isEmpty ? null : errors;
  }

  // Confirm Password
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return 'confirmPasswordRequired';
    }
    if (value != password) {
      return 'passwordsDoNotMatch';
    }
    return null;
  }

  // Phone number (example for Egypt)
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'phoneRequired';
    }

    final phoneRegex = RegExp(r'^01[0-9]{9}$');

    if (!phoneRegex.hasMatch(value.trim())) {
      return 'invalidEgyptianPhone';
    }

    return null;
  }

  // Pin
  static String? pin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'pinRequired';
    }

    value = value.trim();

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'pinDigitsOnly';
    }

    if (value.length != 6) {
      return 'pinInvalidLength';
    }

    return null;
  }
}
