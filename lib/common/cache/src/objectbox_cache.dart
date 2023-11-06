import '../../../objectbox.g.dart';
import '../../db/db.dart';
import 'cache.dart';

class ObjectboxCache extends Cache {
  Box<ObjectboxCacheModel> _box() => store.box<ObjectboxCacheModel>();
  QueryBuilder<ObjectboxCacheModel> _query(String key) =>
      _box().query(ObjectboxCacheModel_.key.equals(key));

  @override
  bool? getBool(String key) {
    final query = _query(key).build();
    final value = query.findFirst();
    query.close();
    return value?.valueBool;
  }

  @override
  double? getDouble(String key) {
    final query = _query(key).build();
    final value = query.findFirst();
    query.close();
    return value?.valudeDouble;
  }

  @override
  int? getInt(String key) {
    final query = _query(key).build();
    final value = query.findFirst();
    query.close();
    return value?.valueInt;
  }

  @override
  String? getString(String key) {
    final query = _query(key).build();
    final value = query.findFirst();
    query.close();
    return value?.valueString;
  }

  @override
  Future<void> remove(String key) async {
    final query = _query(key).build();
    query.remove();
    query.close();
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _box().putAsync(ObjectboxCacheModel(key)..valueBool = value);
  }

  @override
  Future<void> setDouble(String key, double value) async {
    await _box().putAsync(ObjectboxCacheModel(key)..valudeDouble = value);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _box().putAsync(ObjectboxCacheModel(key)..valueInt = value);
  }

  @override
  Future<void> setString(String key, String value) async {
    await _box().putAsync(ObjectboxCacheModel(key)..valueString = value);
  }
}

@Entity(uid: 1)
class ObjectboxCacheModel {
  @Id()
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String key;

  int? valueInt;
  String? valueString;
  bool? valueBool;
  double? valudeDouble;

  ObjectboxCacheModel(this.key);
}
