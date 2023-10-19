import 'helpers/storage.dart';

const countryKey = 'country';

/// This class represents a store for managing countries.
///
/// It provides methods for retrieving and saving the current country.
/// This class represents a store for managing countries.
///
/// It provides methods for retrieving and saving the current country.
class CountriesStore {
  final Storage _storage;

  /// Constructs a new instance of the CountriesStore.
  ///
  /// The [storage] parameter is used for interacting with the storage system.
  CountriesStore(this._storage);

  /// Retrieves the current country from the storage.
  ///
  /// Returns a [Future] that resolves to the current country.
  Future<String?> get currentCountry {
    return Future.value(_storage.get(countryKey));
  }

  /// Saves the current country to the storage.
  ///
  /// The [id] parameter is the identifier of the country to be saved.
  ///
  /// Returns a [Future] that completes once the country is saved.
  Future<void> saveCurrentCountry(String id) {
    return _storage.put(countryKey, id);
  }
}
