import 'config/helpers/injector.dart';
import 'data/datasources/local/countries_store.dart';
import 'data/datasources/local/helpers/storage.dart';
import 'data/datasources/local/session_store.dart';
import 'data/datasources/remote/account_api.dart';
import 'data/datasources/remote/competition_api.dart';
import 'data/datasources/remote/countries_api.dart';
import 'data/datasources/remote/helpers/http_client.dart';
import 'data/repositories/competition_repository_imp.dart';
import 'data/repositories/countries_repository_imp.dart';
import 'data/repositories/repositories.dart';
import 'domain/repositories/competition_repository.dart';
import 'domain/repositories/countries_repository.dart';
import 'domain/repositories/repositories.dart';

Future<void> injectRepositories({
  required Storage storage,
  required HttpClient http,
}) async {
  /// The code block is creating instances of different classes that are used for data storage and API communication.
  final sessionStore = SessionStore(storage);
  final countriesStore = CountriesStore(storage);

  final accountAPI = AccountAPI(sessionStore);
  final countriesAPI = CountriesAPI(http);
  final competitionAPI = CompetitionAPI(http);

  /// The code block is using the `Injector` class to register instances of different repository implementations.
  Injector.instance.put<AuthRepository>(
    AuthRepositoryImp(
      accountAPI,
      sessionStore,
    ),
  );
  Injector.instance.put<AccountRepository>(
    AccountRepositoryImp(
      sessionStore,
    ),
  );
  Injector.instance.put<CountriesRepository>(
    CountriesRepositoryImp(countriesAPI, countriesStore),
  );
  Injector.instance.put<CompetitionRepository>(
    CompetitionRepositoryImp(competitionAPI),
  );
}

/// The class "Repositories" provides static methods to access different repositories.
class Repositories {
  Repositories._();

  static AuthRepository get authentication => Injector.I.find();
  static AccountRepository get account => Injector.I.find();
  static CountriesRepository get countries => Injector.I.find();
  static CompetitionRepository get competition => Injector.I.find();
}
