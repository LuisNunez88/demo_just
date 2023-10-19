import '../../domain/entities/either.dart';
import '../../domain/entities/user.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/local/session_store.dart';
import '../mappers/user_mapper.dart';

/// The `AccountRepositoryImp` class is an implementation of the `AccountRepository` interface that retrieves user data from
/// a session store.
class AccountRepositoryImp implements AccountRepository {
  final SessionStore _sessionStore;
  AccountRepositoryImp(
    this._sessionStore,
  );

  /// The function retrieves user data from a session store and returns it as an Either object, with the data mapped to a
  /// User entity if successful.
  ///
  /// Returns:
  ///   The method is returning a `Future` that will either resolve to an `Either` object containing a `Failure` or a `User`
  /// object.
  @override
  Future<Either<Failure, User>> getUserData() async {
    try {
      final data = await _sessionStore.userData;
      return Either.right(UserMapper.dbToEntity(data!));
    } catch (e) {
      return Either.left(Failure.unknown());
    }
  }
}
