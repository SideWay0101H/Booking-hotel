import 'package:shared_preferences/shared_preferences.dart';

class SharedServices {
  late final SharedPreferences _prefs;
  Future<SharedServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setStringValue(String key, String value) async {
    return await _prefs.setString(key, value);
  }
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  String getStringValue(String key) {
    return _prefs.getString(key) ?? '';
  }

}
