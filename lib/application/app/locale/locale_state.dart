part of 'locale_cubit.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState({required Locale locale}) = _LocaleState;
  factory LocaleState.initial(Locale locale) = _Initial;
}
