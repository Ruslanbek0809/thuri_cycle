import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/app/app_cubit.dart';
import 'package:thuri_cycle/application/app/locale/locale_cubit.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
import 'package:thuri_cycle/application/auth/profile_user_form/profile_user_form_cubit.dart';
import 'package:thuri_cycle/application/profile/settings_form_cubit.dart';
import 'package:thuri_cycle/application/report_waste/map_marker_form_cubit.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.dart';
import 'package:thuri_cycle/l10n/l10n.dart';
import 'package:thuri_cycle/presentation/core/utils/constants.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:thuri_cycle/router.dart';

//TODO: Before production, implement flutter analyze and refactor issues found by this command at the end
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AppCubit>()),
        BlocProvider(create: (_) => getIt<LocaleCubit>()..initLocale()),
        BlocProvider<ProfileUserFormCubit>(
          lazy: false,
          // Since you’re watching user model from start, lazy: false is fine here.
          // If I initialize it only when user goes to profile page, then lazy: true would fit here.
          create: (context) => getIt<ProfileUserFormCubit>(),
        ),
        BlocProvider(create: (_) => getIt<SettingsFormCubit>()),
        //TODO: If possible try to move it just before MapPage
        BlocProvider<MapMarkerFormCubit>(
          create: (context) => getIt<MapMarkerFormCubit>(),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous != current && current is Authenticated,
        listener: (context, state) {
          if (state is Authenticated) {
            context.read<ProfileUserFormCubit>().watchUserModelFromFb();
          }
        },
        child: BlocBuilder<AppCubit, AppState>(
          buildWhen: (p, c) => p.theme != c.theme,
          builder: (context, appState) {
            return BlocBuilder<LocaleCubit, LocaleState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, localeState) {
                return MaterialApp.router(
                  scaffoldMessengerKey: scaffoldMessengerKey,
                  routerConfig: appRouter.config(
                    navigatorObservers: () => [
                      AutoRouteObserver(),
                      // SentryNavigatorObserver(),
                    ],
                  ),
                  //* Theme configuration.
                  theme: appState.theme.light,
                  darkTheme: appState.theme.dark,
                  themeMode: appState.theme.mode,

                  //* Environment configuration.
                  title: $constants.appTitle,

                  //* Localization configuration. Built-in flutter_localizations package.
                  locale: localeState.locale,
                  //* SETS initial locale
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
