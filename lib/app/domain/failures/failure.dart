import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// The above class defines different types of failures with default error messages.
@freezed
class Failure with _$Failure {
  factory Failure.notFound([@Default('Data not found') String? message]) =
      FailureNotFound;
  factory Failure.notVerified([@Default('Data not verified') String? message]) =
      FailureNotVerified;
  factory Failure.network(
      [@Default('Network connection error') String? message]) = FailureNetwork;
  factory Failure.unauthorized([@Default('Unauthorized') String? message]) =
      FailureUnauthorized;
  factory Failure.unknown([@Default('Unknown error') String? message]) =
      FailureUnknown;
}
