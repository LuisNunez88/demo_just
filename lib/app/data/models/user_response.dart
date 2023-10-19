import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

/// Represents a user response.
@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required int id,
    required String name,
    required String email,
    required String token,
    String? image,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
