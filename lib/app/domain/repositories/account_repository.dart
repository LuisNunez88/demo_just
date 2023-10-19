import 'dart:async';

import '../entities/either.dart';
import '../entities/user.dart';
import '../failures/failure.dart';

/// The AccountRepository class is an abstract class that defines a method to retrieve user data asynchronously, returning
/// either a Failure or a User object.
abstract class AccountRepository {
  Future<Either<Failure, User>> getUserData();
}
