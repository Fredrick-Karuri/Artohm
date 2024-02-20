import 'package:shared_preferences/shared_preferences.dart';


// store the localstorage in binding 


class LocalStorageService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setStringList(String key, List<String> value) async {
    final prefs = await _prefs;
    await prefs.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    final prefs = await _prefs;
    return prefs.getStringList(key);
  }

  Future<void> clearLocalStorage() async {
    final prefs = await _prefs;
    await prefs.clear();
  }
}
