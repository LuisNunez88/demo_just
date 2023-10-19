import '../../../config/constants/url_api.dart';
import '../../../domain/entities/country.dart';
import '../../mappers/country_mapper.dart';
import '../../models/countries_response.dart';
import 'helpers/http_client.dart';

class CountriesAPI {
  final HttpClient _http;
  CountriesAPI(this._http);

  /// The function `getCountries` makes an HTTP GET request to retrieve a list of countries and parses the response into a
  /// list of `Country` objects.
  ///
  /// Returns:
  ///   The method `getCountries` returns a `Future` object that resolves to an `HttpResponse` containing a list of
  /// `Country` objects.
  Future<HttpResponse<List<Country>>> getCountries() async {
    return await _http.request<List<Country>>(
      UrlAPI.getCountries,
      method: "GET",
      queryParameters: {
        "action": "get_countries",
      },
      parser: (resp) {
        List<Country> countries = countryResponseFromJson(resp)
            .map((item) => CountryMapper.responseToEntity(item))
            .toList();
        return countries;
      },
    );
  }
}
