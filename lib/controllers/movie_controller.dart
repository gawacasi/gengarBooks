import 'package:shared_preferences/shared_preferences.dart';

class MovieController {
  late String _movieId;
  static const String _movieIdKey = 'movie_id';

  String get movieId => _movieId;

  Future<void> saveMovieId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_movieIdKey, id);
    _movieId = id;
  }

  Future<String> loadMovieId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _movieId = prefs.getString(_movieIdKey) ?? '';
    return _movieId;
  }
}
