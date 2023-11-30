import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  late String _userId;
  static const String _userIdKey = 'user_id';

  String get userId => _userId;

  Future<void> saveUserId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, id);
    _userId = id;
  }

  Future<String> loadUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString(_userIdKey) ?? ''; // Initialize _userId here
    return _userId;
  }
}