import '../../../config/constants/url_api.dart';
import '../../../domain/entities/competition.dart';
import '../../mappers/competition_mapper.dart';
import '../../models/competition_response.dart';
import 'helpers/http_client.dart';

class CompetitionAPI {
  final HttpClient _http;
  CompetitionAPI(this._http);

  /// The function `getCompetitions` makes an HTTP GET request to retrieve a list of competitions based on a country ID.
  ///
  /// Args:
  ///   countryId (String): The countryId parameter is used to specify the ID of the country for which you want to retrieve
  /// competitions.
  ///
  /// Returns:
  ///   The method `getCompetitions` returns a `Future` object that resolves to an `HttpResponse` containing a list of
  /// `Competition` objects.
  Future<HttpResponse<List<Competition>>> getCompetitions(
      String countryId) async {
    return await _http.request<List<Competition>>(
      UrlAPI.getCountries,
      method: "GET",
      queryParameters: {
        "action": "get_leagues",
        "country_id": countryId,
      },
      parser: (resp) {
        List<Competition> competitions = competitionsResponseFromJson(resp)
            .map((item) => CompetitionMapper.responseToEntity(item))
            .toList();
        return competitions;
      },
    );
  }
}
