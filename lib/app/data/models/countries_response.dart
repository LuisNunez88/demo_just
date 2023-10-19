import 'package:freezed_annotation/freezed_annotation.dart';

part 'countries_response.freezed.dart';
part 'countries_response.g.dart';

List<CountryResponse> countryResponseFromJson(List<dynamic> str) =>
    List<CountryResponse>.from(str.map((x) => CountryResponse.fromJson(x)));

/// Represents a country response.
@freezed
class CountryResponse with _$CountryResponse {
  const factory CountryResponse({
    @JsonKey(name: "country_id") required String countryId,
    @JsonKey(name: "country_name") required String countryName,
    @JsonKey(name: "country_logo") String? countryLogo,
  }) = _CountryResponse;

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);
}
