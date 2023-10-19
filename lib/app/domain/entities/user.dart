import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// The above class represents a user with an id, name, email, and an optional avatar.
@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    String? avatar,
  }) = _User;
}
