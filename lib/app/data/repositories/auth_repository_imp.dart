import '../../domain/entities/either.dart';
import '../../domain/entities/user.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/session_store.dart';
import '../datasources/remote/account_api.dart';
import '../datasources/remote/helpers/result_handler.dart';

/// The AuthRepositoryImp class is an implementation of the AuthRepository interface that handles authentication and session
/// management.
class AuthRepositoryImp implements AuthRepository {
  final AccountAPI _accountAPI;
  final SessionStore _sessionStore;
  AuthRepositoryImp(
    this._accountAPI,
    this._sessionStore,
  );

  /// The login function sends a login request with the provided email and password and returns the result as an Either
  /// type, which can be either a Failure or a User.
  ///
  /// Args:
  ///   email (String): The email parameter is a string that represents the user's email address.
  ///   password (String): The "password" parameter is a string that represents the user's password.
  ///
  /// Returns:
  ///   The method is returning a `Future` that resolves to an `Either` object. The `Either` object can hold either a
  /// `Failure` or a `User` object.
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    final response = await _accountAPI.login(email: email, password: password);
    return resultHandler<User>(response);
  }

  /// The function `logout` sends a logout request to the `_accountAPI` and returns a `Future` that resolves to an `Either`
  /// containing a `Failure` or a `bool` value.
  ///
  /// Returns:
  ///   The method is returning a `Future` that resolves to an `Either` object. The `Either` object can contain either a
  /// `Failure` object or a `bool` value.
  @override
  Future<Either<Failure, bool>> logout() async {
    final response = await _accountAPI.logout();
    return resultHandler<bool>(response);
  }

  /// The `isSignedIn` method is a getter that returns a `Future<bool>`. It checks if a session token exists in the
  /// `_sessionStore` by calling the `sessionToken` method. If a session token exists, it means that the user is signed in,
  /// so it returns `true`. Otherwise, it returns `false`.
  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _sessionStore.sessionToken;
    return sessionId != null;
  }

  /// The `isCountrySelected` method is a getter that returns a `Future<bool>`. It checks if a country ID exists in the store
  @override
  Future<bool> get isCountrySelected async {
    final countryId = await _sessionStore.currenCountry;
    return countryId != null;
  }
}
