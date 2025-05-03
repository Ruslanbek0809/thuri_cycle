part of 'settings_form_cubit.dart';

@freezed
class SettingsFormState with _$SettingsFormState {
  factory SettingsFormState({
    required LanguageModel? languageModel,
    required PackageInfo? packageInfo,
    required bool isLoading,
    required bool showError,
    required Option<Either<AlertModel, Unit>> optionOfSuccessOrFailure,
  }) = _SettingsFormState;

  factory SettingsFormState.initial() => SettingsFormState(
        languageModel: null,
        packageInfo: null,
        isLoading: false,
        showError: false,
        optionOfSuccessOrFailure: none(),
      );
}
