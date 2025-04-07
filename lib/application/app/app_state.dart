part of 'app_cubit.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({required ThemeModel theme}) = _AppState;

  factory AppState.initial() => _AppState(theme: getIt<ThemeModel>());
}
