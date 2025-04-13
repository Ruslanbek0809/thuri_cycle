import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuri_cycle/application/app/app_cubit.dart';
import 'package:thuri_cycle/application/app/locale/locale_cubit.dart';
import 'package:thuri_cycle/application/auth/auth_bloc.dart';
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
        // BlocProvider(
        //   lazy: false,
        //   create: (_) => getIt<SettingsFormCubit>()..initDiosAndHiveBoxes(),
        // ),
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
      ],
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
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
              );
            },
          );
        },
      ),
    );
  }
}
