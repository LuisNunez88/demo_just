import '../../domain/entities/competition.dart';
import '../../domain/entities/either.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/competition_repository.dart';
import '../datasources/remote/competition_api.dart';
import '../datasources/remote/helpers/result_handler.dart';

/// The `CompetitionRepositoryImp` class is an implementation of the `CompetitionRepository` interface that retrieves competitions from
/// a specific country.
class CompetitionRepositoryImp extends CompetitionRepository {
  final CompetitionAPI _competitonApi;
  CompetitionRepositoryImp(this._competitonApi);

  /// Retrieves a list of competitions for a specific country.
  @override
  Future<Either<Failure, List<Competition>>> getCompetitions(
      String countryId) async {
    try {
      final response = await _competitonApi.getCompetitions(countryId);
      return resultHandler<List<Competition>>(response);
    } catch (e) {
      return Either.left(Failure.unknown(e.toString()));
    }
  }
}
