import '../entities/competition.dart';
import '../entities/either.dart';
import '../failures/failure.dart';

/// The abstract class CompetitionRepository defines a method to retrieve a list of competitions based on a country ID.
abstract class CompetitionRepository {
  Future<Either<Failure, List<Competition>>> getCompetitions(String countryId);
}
