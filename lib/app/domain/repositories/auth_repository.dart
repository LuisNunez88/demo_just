import '../entities/either.dart';
import '../entities/user.dart';
import '../failures/failure.dart';

/// The AuthRepository class defines methods for checking if a user is signed in, if a country is selected, logging out, and
/// logging in.
abstract class AuthRepository {
  Future<bool> get isSignedIn;
  Future<bool> get isCountrySelected;
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, User>> login(String email, String password);
}
