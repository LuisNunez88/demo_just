import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition.freezed.dart';

/// The above class represents a competition with properties such as countryId, countryName, countryImage, id, name, season,
/// and image.
@freezed
class Competition with _$Competition {
  const factory Competition({
    required String countryId,
    required String countryName,
    required String countryImage,
    required String id,
    required String name,
    @Default('') String seson,
    required String image,
  }) = _Competition;
}
