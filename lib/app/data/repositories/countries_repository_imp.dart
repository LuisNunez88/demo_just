import '../../domain/entities/country.dart';
import '../../domain/entities/either.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/countries_repository.dart';
import '../datasources/local/countries_store.dart';
import '../datasources/remote/countries_api.dart';
import '../datasources/remote/helpers/result_handler.dart';

class CountriesRepositoryImp extends CountriesRepository {
  final CountriesAPI _countriesApi;
  final CountriesStore _countriesStore;
  CountriesRepositoryImp(this._countriesApi, this._countriesStore);

  /// Retrieves a list of countries from the API.
  ///
  /// This method makes an API call to retrieve a list of countries and returns
  /// the result as an [Either] object. The left side of the [Either] contains
  /// a [Failure] object in case of an error, and the right side contains
  /// a list of [Country] objects.

  @override
  Future<Either<Failure, List<Country>>> getCountries() async {
    try {
      final response = await _countriesApi.getCountries();
      return resultHandler<List<Country>>(response);
    } catch (e) {
      return Either.left(Failure.unknown(e.toString()));
    }
  }

  /// Retrieves the current country from the store.
  ///
  /// This method retrieves the current country from the [CountriesStore]
  /// and returns it as a [String?].

  @override
  Future<String?> getCurrentCountry() {
    return _countriesStore.currentCountry;
  }

  /// Sets the current country in the store.
  ///
  /// This method saves the provided [id] as the current country in the
  /// [CountriesStore].
  @override
  Future<void> setCurrentCountry(String id) {
    return _countriesStore.saveCurrentCountry(id);
  }
}
