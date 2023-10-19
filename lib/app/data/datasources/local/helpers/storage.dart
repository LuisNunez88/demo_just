import 'package:hive/hive.dart';

/// The `Storage` class is a generic class that provides methods for storing and retrieving data from a box.
class Storage<E> extends StorageBase<E> {
  final Box _box;
  Storage(this._box);

  /// The function clears all data from a box and returns the number of items cleared.
  ///
  /// Returns:
  ///   The method is returning a Future<int>.
  @override
  Future<int> clear() async {
    return await _box.clear();
  }

  @override
  E? get(key, {E? defaultValue}) {
    return _box.get(key, defaultValue: defaultValue);
  }

  /// The function `put` stores a value with a given key in a box.
  ///
  /// Args:
  ///   key: The key is a unique identifier used to store and retrieve the value in the box. It can be of any type, such as
  /// a string or an integer.
  ///   value (E): The "value" parameter represents the value of type E that you want to store in the box with the specified
  /// key.
  @override
  Future<void> put(key, E value) async {
    await _box.put(key, value);
  }
}

abstract class StorageBase<E> {
  /// Returns the value associated with the given [key]. If the key does not
  /// exist, `null` is returned.
  ///
  /// If [defaultValue] is specified, it is returned in case the key does not
  /// exist.
  E? get(dynamic key, {E? defaultValue});

  /// Saves the [key] - [value] pair.
  Future<void> put(dynamic key, E value);

  /// Removes all entries from the storage.
  Future<int> clear();
}
