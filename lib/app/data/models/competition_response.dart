import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_response.freezed.dart';
part 'competition_response.g.dart';

List<CompetitionResponse> competitionsResponseFromJson(List<dynamic> str) =>
    List<CompetitionResponse>.from(
        str.map((x) => CompetitionResponse.fromJson(x)));

/// Represents a competition response.
@freezed
class CompetitionResponse with _$CompetitionResponse {
  const factory CompetitionResponse({
    @JsonKey(name: "country_id") required String countryId,
    @JsonKey(name: "country_name") required String countryName,
    @JsonKey(name: "league_id") required String leagueId,
    @JsonKey(name: "league_name") required String leagueName,
    @JsonKey(name: "league_season") required String leagueSeason,
    @JsonKey(name: "league_logo") String? leagueLogo,
    @JsonKey(name: "country_logo") String? countryLogo,
  }) = _CompetitionResponse;

  factory CompetitionResponse.fromJson(Map<String, dynamic> json) =>
      _$CompetitionResponseFromJson(json);
}
