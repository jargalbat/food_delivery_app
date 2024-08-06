import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref _instance = SharedPref._internal();
  late SharedPreferences _prefs;

  factory SharedPref() {
    return _instance;
  }

  SharedPref._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs => _prefs;

  Future<void> savePhoneNumber(String phoneNumber) async {
    await _prefs.setString('phone_number', phoneNumber);
  }

  String? getPhoneNumber() {
    return _prefs.getString('phone_number');
  }
}
