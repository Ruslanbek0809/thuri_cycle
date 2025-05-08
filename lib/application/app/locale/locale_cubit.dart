import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

part 'locale_state.dart';
part 'locale_cubit.freezed.dart';

@injectable
class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(
    this.sharedPreferences,
  ) : super(LocaleState.initial(const Locale('de')));

  final SharedPreferences sharedPreferences;

  Future<void> initLocale() async {
    final appLocale = sharedPreferences.getString($constants.appLocale);
    emit(state.copyWith(locale: Locale(appLocale ?? 'de')));
  }

  Future<void> changeLocale(Locale newLocale) async {
    final locale = newLocale;
    await sharedPreferences.setString(
      $constants.appLocale,
      locale.languageCode,
    );
    talker.info(
      'changeLocale() locale: $locale, locale.languageCode: ${locale.languageCode}, newLocale.languageCode: ${newLocale.languageCode}',
    );
    emit(state.copyWith(locale: locale));
  }
}
