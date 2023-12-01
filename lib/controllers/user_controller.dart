import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  late String _userId;
  late String _username;
  static const String _userIdKey = 'user_id';
  static const String _usernameKey = 'username';

  String get userId => _userId;
  String get username => _username;

  Future<void> saveUserId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, id);
    _userId = id;
  }

  Future<void> saveUsername(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, id);
    _username = id;
  }

  Future<String> loadUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString(_userIdKey) ?? ''; // Initialize _userId here
    return _userId;
  }

  Future<String> loadUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = prefs.getString(_usernameKey) ?? ''; // Initialize _userId here
    return _username;
  }
}
