import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/context_extentions.dart';

typedef SingleValidator = String? Function(String? value);
typedef MultiValidator = List<String>? Function(String? value);

extension ValidatorLocalizationExtension on BuildContext {
  FormFieldValidator<String> l10nValidator(SingleValidator validator) {
    return (value) {
      final key = validator(value);
      return _translate(key);
    };
  }

  FormFieldValidator<String> l10nMultiValidator(MultiValidator validator) {
    return (value) {
      final keys = validator(value);
      if (keys == null) return null;

      final translated = keys.map(_translate).join(', ');
      return l10n.passwordMustContain(translated);
    };
  }

  String? _translate(String? key) {
    if (key == null) return null;

    switch (key) {
      case 'nameRequired':
        return l10n.nameRequired;

      case 'nameMinLength':
        return l10n.nameMinLength;

      case 'emailRequired':
        return l10n.emailRequired;

      case 'invalidEmail':
        return l10n.invalidEmail;

      case 'passwordRequired':
        return l10n.passwordRequired;

      case 'passwordMinLength':
        return l10n.passwordMinLength;

      case 'passwordUppercase':
        return l10n.passwordUppercase;

      case 'passwordLowercase':
        return l10n.passwordLowercase;

      case 'passwordNumber':
        return l10n.passwordNumber;

      case 'passwordSpecial':
        return l10n.passwordSpecial;

      case 'confirmPasswordRequired':
        return l10n.confirmPasswordRequired;

      case 'passwordsDoNotMatch':
        return l10n.passwordsDoNotMatch;

      case 'phoneRequired':
        return l10n.phoneRequired;

      case 'invalidEgyptianPhone':
        return l10n.invalidEgyptianPhone;

      case 'pinRequired':
        return l10n.pinRequired;

      case 'pinDigitsOnly':
        return l10n.pinDigitsOnly;

      case 'pinInvalidLength':
        return l10n.pinInvalidLength;

      default:
        return key;
    }
  }
}
