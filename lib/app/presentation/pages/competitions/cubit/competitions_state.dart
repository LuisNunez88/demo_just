part of 'competitions_cubit.dart';

@freezed
abstract class CompetitionsState with _$CompetitionsState {
  /// Data is present state
  const factory CompetitionsState({
    @Default(false) bool isFetching,
    @Default([]) List<Competition> data,
    @Default([]) List<Competition> competitions,
  }) = _Initial;
}
