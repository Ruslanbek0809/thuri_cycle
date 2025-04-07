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
  LocaleCubit()
      : super(
          LocaleState.initial(
            const Locale('en'), //* SETS initial app locale (Default: en)
          ),
        );

  Future<void> initLocale() async {
    final sharedPref = await SharedPreferences.getInstance();
    final appLocale = sharedPref.getString($constants.appLocale);
    emit(
      state.copyWith(
        locale: Locale(
          appLocale ?? 'en', //* SETS initial app locale (Default: en)
        ),
      ),
    );
  }

  Future<void> changeLocale(Locale newLocale) async {
    final locale = newLocale;
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString($constants.appLocale, locale.languageCode);
    talker.info(
      'changeLocale() locale: $locale, locale.languageCode: ${locale.languageCode}, newLocale.languageCode: ${newLocale.languageCode}',
    );
    emit(state.copyWith(locale: locale));
  }
}
