import 'package:github_repository_search/src/export_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final SharedPreferences _sharedPreferences;

  SharedPrefService(this._sharedPreferences);

  Future<bool> setBool(
    String key,
    bool value,
  ) {
    return _sharedPreferences
        .setBool(
          key,
          value,
        )
        .whenComplete(() => logger.i('[$_prefix] set bool for key: $key'));
  }

  static const _prefix = 'SharedPrefService';

  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  Future<bool> setInt(String key, int value) {
    return _sharedPreferences
        .setInt(key, value)
        .whenComplete(() => logger.i('[$_prefix] set int for key: $key'));
  }

  int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  Future<bool> setDouble(String key, double value) {
    return _sharedPreferences
        .setDouble(key, value)
        .whenComplete(() => logger.i('[$_prefix] set double for key: $key'));
  }

  double? getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  Future<bool> setString(String key, String value) {
    return _sharedPreferences
        .setString(key, value)
        .whenComplete(() => logger.i('[$_prefix] set string for key: $key'));
  }

  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  Future<bool> remove(String key) {
    return _sharedPreferences
        .remove(key)
        .whenComplete(() => logger.i('[$_prefix] removed value for key: $key'));
  }

  Future<bool> clear() async {
    return _sharedPreferences.clear().whenComplete(
          () => logger.i('[$_prefix] cleared all sharedPreferences.'),
        );
  }

  bool contains(String key) {
    return _sharedPreferences.containsKey(key);
  }

  List<String> getStringList(String key) {
    return _sharedPreferences.getStringList(key) ?? [];
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return _sharedPreferences.setStringList(key, value).whenComplete(
          () => logger.i('[$_prefix] updated string list for key: $key'),
        );
  }
}
