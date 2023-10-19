import '../../domain/entities/country.dart';
import '../models/countries_response.dart';

class CountryMapper {
  static Country responseToEntity(CountryResponse resp) => Country(
        id: resp.countryId,
        name: resp.countryName,
        image: resp.countryLogo ??
            'https://upload.wikimedia.org/wikipedia/commons/d/d5/User_Default_Gravatar.png?20201228191829',
      );
}
