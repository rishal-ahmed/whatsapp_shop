import 'package:flutter/services.dart' show FilteringTextInputFormatter;

class Validators {
  //========== Null Validator ==========
  static String? nullValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required*';
    }
    return null;
  }

  //========== Username Validator ==========
  static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required*';
    } else if (value.contains(' ')) {
      return 'Username cannot contain space*';
    }
    return null;
  }

  //========== Number Validator ==========
  String? numberValidator(String? value) {
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '"$value" is not a valid number';
    }
    return null;
  }

  //========== Number Validator ==========
  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required*';
    }
    if (value.trim().length < 8) {
      return 'Password must be at least 8 characters';
    }
    // Return null if the entered password is valid
    return null;
  }

  //========== Email Validator ==========
  static String? vatValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final vat = num.tryParse(value);
    if (vat == null || value.length != 15) {
      return 'Please enter a valid VAT number';
    }

    return null;
  }

  //========== Phone Number Validator ==========
  static String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required*';
    } else if (!RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(value)) {
      if (value.length != 10) {
        return 'Mobile number must 10 digits';
      } else {
        return 'Please enter a valid Phone Number';
      }
    }

    return null;
  }

  //Force keyboard to input digits only
  static final List<FilteringTextInputFormatter> digitsOnly = [
    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
  ];

  //Validating email pattern that user entered
  static final RegExp emailValidator = RegExp(r'\S+@\S+\.\S+');
}
