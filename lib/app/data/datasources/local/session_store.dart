import 'helpers/storage.dart';

const tokenKey = 'token';
const userKey = 'user';
const countryKey = 'country';

/// This class represents a session store for managing user sessions.

class SessionStore {
  final Storage _storage;
  SessionStore(this._storage);

  /// The `Future<String?> get currentCountry` method is a getter that returns a `Future` that resolves to a nullable
  /// `String`. It retrieves the value of the `countryKey` from the `_storage` object using the `get` method and wraps it in
  /// a `Future.value` to return it as a `Future`.
  Future<String?> get currenCountry {
    return Future.value(_storage.get(countryKey));
  }

  /// The `Future<String?> get sessionToken` method is a getter that returns a `Future` that resolves to a nullable
  /// `String`. It retrieves the value of the `tokenKey` from the `_storage` object using the `get` method and wraps it in a
  /// `Future.value` to return it as a `Future`. This method is used to retrieve the session token from the storage.
  Future<String?> get sessionToken {
    return Future.value(_storage.get(tokenKey));
  }

  /// The function saves a session token to storage.
  ///
  /// Args:
  ///   token (String): The "token" parameter is a string that represents the session token that needs to be saved.
  ///
  /// Returns:
  ///   a `Future<void>`.
  Future<void> saveSessionToken(String token) {
    return _storage.put(tokenKey, token);
  }

  /// The `Future<String?> get userData` method is a getter that returns a `Future` that resolves to a nullable `String`. It
  /// retrieves the value of the `userKey` from the `_storage` object using the `get` method and wraps it in a
  /// `Future.value` to return it as a `Future`. This method is used to retrieve the user data from the storage.
  Future<String?> get userData {
    return Future.value(_storage.get(userKey));
  }

  /// The function `saveUserData` saves user data to storage.
  ///
  /// Args:
  ///   data (String): The data parameter is a string that represents the user's data that needs to be saved.
  ///
  /// Returns:
  ///   a `Future<void>`.
  Future<void> saveUserData(String data) {
    return _storage.put(userKey, data);
  }

  /// The `logout` function clears the storage.
  Future<void> logout() async {
    await _storage.clear();
  }
}
