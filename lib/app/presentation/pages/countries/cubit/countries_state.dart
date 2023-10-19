part of 'countries_cubit.dart';

@freezed
abstract class CountriesState with _$CountriesState {
  const factory CountriesState({
    @Default(false) bool isFetching,
    @Default([]) List<Country> data,
    @Default([]) List<Country> countries,
  }) = _Initial;
}
