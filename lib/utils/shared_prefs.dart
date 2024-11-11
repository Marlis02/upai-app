import 'package:ctmax_upai/models/common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<String?> getPrefs(String key) {
  return SharedPreferences.getInstance().then((prefs) => prefs.getString(key));
}

Future<DataParam?> getPrefsData(String key) {
  return SharedPreferences.getInstance().then((prefs) => switch (
          prefs.getString(key)) {
        null => null,
        _ => jsonDecode(prefs.getString(key) ?? '')
      });
}

Future<bool> setPrefs(String key, String? value) {
  return SharedPreferences.getInstance()
      .then((prefs) => prefs.setString(key, value ?? ''));
}

Future<bool> setPrefsData(String key, DataParam? value) {
  return SharedPreferences.getInstance()
      .then((prefs) => prefs.setString(key, jsonEncode(value)));
}

Future<bool> setPrefsDataList(String key, List<DataParam?> value) {
  return SharedPreferences.getInstance()
      .then((prefs) => prefs.setString(key, jsonEncode(value)));
}

Future<List<DataParam?>?> getPrefsDataList(String key) {
  return SharedPreferences.getInstance()
      .then((prefs) => jsonDecode(prefs.getString(key) ?? ''));
}

Future<bool> removePrefs(String key) {
  return SharedPreferences.getInstance().then((p) => p.remove(key));
}

Future<bool> clearPrefs() {
  return SharedPreferences.getInstance().then((prefs) => prefs.clear());
}

Future<Set<String>> prefsKeys() {
  return SharedPreferences.getInstance().then((prefs) => prefs.getKeys());
}
