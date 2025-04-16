import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thuri_cycle/domain/core/alert_model.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';

part 'settings_form_cubit.freezed.dart';

part 'settings_form_state.dart';

@injectable
class SettingsFormCubit extends Cubit<SettingsFormState> {
  SettingsFormCubit(
    this.sharedPreferences,
  ) : super(SettingsFormState.initial());

  final SharedPreferences sharedPreferences;

  Future<void> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    emit(
      state.copyWith(
        packageInfo: packageInfo,
        // optionOfSuccessOrFailure: none(),
      ),
    );
  }

  // //* RUNS in SplashLottiePage
  // Future<void> initHiveBoxes() async {
  //   await iHive.initHiveBoxes();
  // }

  // bool isOnboardingSeen() =>
  //     sharedPreferences.getBool($constants.isOnboardingSeen) ?? false;

  // bool isWelcomeCountrySeen() =>
  //     sharedPreferences.getBool($constants.isWelcomeCountrySeen) ?? false;

  Future<void> disableOnboarding() async {
    await sharedPreferences.setBool($constants.isOnboardingSeen, true);
  }

  Future<void> resetSettingsToInitial() async {
    emit(SettingsFormState.initial());
  }

  // Future<void> requestInAppReview() async {
  //   final inAppReview = InAppReview.instance;

  //   if (await inAppReview.isAvailable()) {
  //     await inAppReview.requestReview();
  //   }
  // }
}
