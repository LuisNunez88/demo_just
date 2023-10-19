import '../entities/country.dart';
import '../entities/either.dart';
import '../failures/failure.dart';

/// The `CountriesRepository` class defines an abstract interface for retrieving and setting the current country and
/// fetching a list of countries.
abstract class CountriesRepository {
  Future<String?> getCurrentCountry();
  Future<void> setCurrentCountry(String id);
  Future<Either<Failure, List<Country>>> getCountries();
}
