import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_1/session/session_key.dart';

class SharedPrefsHelper {
  static final SharedPrefsHelper _instance = SharedPrefsHelper._internal();
  factory SharedPrefsHelper() => _instance;
  SharedPrefsHelper._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<bool> saveData(String key, dynamic value) async {
    await init();

    if (value is String) return _prefs!.setString(key, value);
    if (value is bool) return _prefs!.setBool(key, value);
    if (value is int) return _prefs!.setInt(key, value);

    throw Exception('Unsupported data type');
  }

  /// Generic getter
  dynamic getData(String key) {
    return _prefs?.get(key);
  }

  Future<bool> isLoggedIn() async {
    await init();

    final email = _prefs!.getString(PrefKeys.loginId);
    final loggedIn = _prefs!.getBool(PrefKeys.isLoggedIn) ?? false;

    return loggedIn && email != null && email.isNotEmpty;
  }

  Future<void> clear() async {
    await init();
    await _prefs!.clear();
  }
}