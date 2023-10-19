import '../../domain/entities/competition.dart';
import '../models/competition_response.dart';

class CompetitionMapper {
  static Competition responseToEntity(CompetitionResponse resp) => Competition(
        countryId: resp.countryId,
        countryName: resp.countryName,
        countryImage: resp.countryLogo ??
            'https://upload.wikimedia.org/wikipedia/commons/d/d5/User_Default_Gravatar.png?20201228191829',
        id: resp.leagueId,
        name: resp.leagueName,
        seson: resp.leagueSeason,
        image: resp.leagueLogo ??
            'https://upload.wikimedia.org/wikipedia/commons/d/d5/User_Default_Gravatar.png?20201228191829',
      );
}
