import '../../../config/constants/enviroment.dart';
import '../../../domain/entities/user.dart';
import '../../mappers/user_mapper.dart';
import '../../models/user_response.dart';
import '../local/session_store.dart';
import 'helpers/http_client.dart';

class AccountAPI {
  final SessionStore _sessionStore;
  AccountAPI(
    this._sessionStore,
  );

  /// The `login` function takes an email and password as parameters, checks if they match a demo email and password, and
  /// returns a `HttpResponse` object with either the user data or an error message.
  ///
  /// Args:
  ///   email (String): The email parameter is a required string that represents the user's email address.
  ///   password (String): The password parameter is a required string that represents the user's password.
  ///
  /// Returns:
  ///   The login function returns a Future object that resolves to an HttpResponse<User>.
  Future<HttpResponse<User>> login({
    required String email,
    required String password,
  }) async {
    return Future.delayed(const Duration(seconds: 1), () {
      if (email == Environment.demoEmail &&
          password == Environment.demoPassword) {
        final json = {
          'id': 1,
          'name': 'Jhon Doe',
          'email': email,
          'token': Environment.apiKey,
        };
        final userResponse = UserResponse.fromJson(json);
        _sessionStore.saveSessionToken(userResponse.token);
        final userData = UserMapper.responseToEntity(userResponse);
        _sessionStore.saveUserData(UserMapper.entityToDb(userData));
        return HttpResponse.success(userData);
      } else {
        return HttpResponse.fail(
          statusCode: 401,
          message: 'Email o contraseña incorrectos',
          data: {},
        );
      }
    });
  }

  /// The `logout` function logs out the user and returns a successful response indicating that the logout was successful.
  ///
  /// Returns:
  ///   The `logout()` function returns a `Future` that will eventually resolve to an `HttpResponse<bool>`.
  Future<HttpResponse<bool>> logout() async {
    return Future.delayed(const Duration(seconds: 1), () async {
      await _sessionStore.logout();
      return HttpResponse.success(true);
    });
  }
}
