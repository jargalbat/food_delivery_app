import 'package:flutter/cupertino.dart';

class Utils {
  static String? validatePhoneNumber(String? value) {
    final regex = RegExp(r'^\d{8}$');
    if (value == null || value.isEmpty) {
      return 'Утасны дугаараа оруулна уу';
    } else if (!regex.hasMatch(value)) {
      return 'Утасны дугаар 8 оронтой байх ёстой';
    }
    return null;
  }

  static String? validateCode(String? value) {
    final regex = RegExp(r'^\d{4}$');
    if (value == null || value.isEmpty) {
      return 'Баталгаажуулах кодоо оруулна уу';
    } else if (!regex.hasMatch(value)) {
      return 'Баталгаажуулах код 4 оронтой байх ёстой';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Нууц үгээ оруулна уу';
    }
    return null;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
