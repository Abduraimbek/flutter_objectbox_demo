abstract class Cache {
  int? getInt(String key);

  String? getString(String key);

  bool? getBool(String key);

  double? getDouble(String key);

  Future<void> setInt(String key, int value);

  Future<void> setString(String key, String value);

  Future<void> setBool(String key, bool value);

  Future<void> setDouble(String key, double value);

  Future<void> remove(String key);
}
