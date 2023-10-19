import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.freezed.dart';

/// The above class represents a country with its id, name, and image.
@freezed
class Country with _$Country {
  const factory Country({
    required String id,
    required String name,
    required String image,
  }) = _Country;
}
