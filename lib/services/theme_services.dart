import 'package:shared_preferences/shared_preferences.dart';

class ThemeServices {
  // Function to get Theme Initially
  static Future<bool> getTheme() async {
    final prefs = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(),
    );
    return prefs.getBool("isDark") ?? false;
  }

  // Function to set Theme
  static Future<void> setTheme(bool value) async {
    final prefs = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(),
    );
    await prefs.setBool("isDark", value);
  }
}
