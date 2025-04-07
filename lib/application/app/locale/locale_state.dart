part of 'locale_cubit.dart';

@freezed
abstract class LocaleState with _$LocaleState {
  const factory LocaleState({required Locale locale}) = _LocaleState;
  factory LocaleState.initial(Locale locale) = _Initial;
}
