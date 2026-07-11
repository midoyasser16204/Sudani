import 'package:flutter/material.dart';

import '../generated/l10n.dart';

enum ValidatorField {
  email,
  password,
}

class Validator {
  static String? validateField(
    String? value,
    ValidatorField field,
    BuildContext context, {
    String? password,
  }) {
    final s = S.of(context);

    if (value == null || value.trim().isEmpty) {
      return _getEmptyMessage(field, s);
    }

    switch (field) {
      case ValidatorField.email:
        if (!RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        ).hasMatch(value)) {
          return s.validatorEmailInvalid;
        }

      case ValidatorField.password:
        if (value.length < 8) {
          return s.validatorPasswordTooShort;
        }
        if (!RegExp(r'[a-z]').hasMatch(value)) {
          return s.validatorPasswordNoLowercase;
        }
        if (!RegExp(r'\d').hasMatch(value)) {
          return s.validatorPasswordNoNumber;
        }
    }

    return null;
  }

  static String _getEmptyMessage(ValidatorField field, S s) {
    switch (field) {
      case ValidatorField.email:
        return s.validatorEmailEmpty;
      case ValidatorField.password:
        return s.validatorPasswordEmpty;
    }
  }
}
