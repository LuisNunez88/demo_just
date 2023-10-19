class Injector {
  Injector._();
  static final _instance = Injector._();

  /// access to the Singleton instance of Injector
  static Injector get instance => _instance;

  /// Short form to access the instance of Injector
  static Injector get I => _instance;

  final _data = <String, dynamic>{};

  /// Generate a unique key for each type
  String _getKey(Type type, String? tag) {
    return '${type.toString()}${tag ?? ''}';
  }

  /// The `put` function stores a value in a map using a specified tag.
  ///
  /// Args:
  ///   value (T): The value that you want to store in the data map. It can be of any type.
  ///   tag (String): The "tag" parameter is an optional parameter of type String. It allows you to provide a tag or label
  /// for the value being stored in the "_data" map.
  ///
  /// Returns:
  ///   The method is returning the value that was passed as an argument.
  T put<T>(
    T value, {
    String? tag,
  }) {
    _data[_getKey(T, tag)] = value;
    return value;
  }

  /// The `find` function in Dart is used to retrieve an object of type `T` based on a given tag.
  ///
  /// Args:
  ///   tag (String): The "tag" parameter is an optional string that can be used to specify a specific tag for the item you
  /// want to find.
  ///
  /// Returns:
  ///   The method is returning an object of type T.
  T find<T>({
    String? tag,
  }) {
    final key = _getKey(T, tag);
    assert(_data.containsKey(key), '$key not found');
    return _data[key]!;
  }

  /// The clear() function clears the data stored in a private variable named _data.
  void clear() {
    _data.clear();
  }
}
