import 'package:shared_preferences/shared_preferences.dart';

class FilmController {
  late String _filmId;
  static const String _filmIdKey = 'film_id';

  String get filmId => _filmId;

  Future<void> saveFilmId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_filmIdKey, id);
    _filmId = id;
  }

  Future<String> loadFilmId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _filmId = prefs.getString(_filmIdKey) ?? '';
    return _filmId;
  }
}
