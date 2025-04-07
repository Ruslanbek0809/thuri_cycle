import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thuri_cycle/domain/app/theme_model.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.dart';
import 'package:thuri_cycle/presentation/core/theme/app_theme.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@lazySingleton
class AppCubit extends HydratedCubit<AppState> {
  AppCubit() : super(AppState.initial());

  Future<void> setThemeMode({required ThemeMode mode}) async {
    final theme = ThemeModel(
      mode: mode,
      light: await createTheme(brightness: Brightness.light),
      dark: await createTheme(brightness: Brightness.dark),
    );

    emit(state.copyWith(theme: theme));
    updateSystemOverlay();

    //* Note: Use createTheme to update your changes inside app_theme.dart
    // if (mode == ThemeMode.system) {
    //   final theme = ThemeModel(
    //     mode: ThemeMode.system,
    //     light: await createTheme(brightness: Brightness.light),
    //     dark: await createTheme(brightness: Brightness.dark),
    //   );
    //   emit(state.copyWith(theme: theme));
    //   updateSystemOverlay();
    // }
  }

  // Future<void> setThemeColor({required Color color}) async {
  //   final theme = ThemeModel(
  //     mode: state.theme.mode,
  //     light: await createTheme(color: color, brightness: Brightness.light),
  //     dark: await createTheme(color: color, brightness: Brightness.dark),
  //   );

  //   emit(state.copyWith(theme: theme));
  //   updateSystemOverlay();
  // }

  void updateSystemOverlay() {
    // final systemModeIsDark =
    //     PlatformDispatcher.instance.platformBrightness == Brightness.dark;
    // final systemModeIsDark =
    //     SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

    final isDark =
        // state.theme.mode == ThemeMode.system
        //     ? systemModeIsDark
        //     :
        state.theme.mode == ThemeMode.dark;
    final colorScheme =
        isDark ? state.theme.dark.colorScheme : state.theme.light.colorScheme;
    final primaryColor = ElevationOverlay.colorWithOverlay(
      colorScheme.surface,
      colorScheme.primary,
      3,
    );

    SystemChrome.setSystemUIOverlayStyle(
      createOverlayStyle(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primaryColor: primaryColor,
      ),
    );
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    final theme = ThemeModel.fromJson(json['theme'] as Map<String, dynamic>);

    return AppState(theme: theme);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return {
      'theme': state.theme.toJson(),
    };
  }
}
