import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thuri_cycle/firebase_options.dart';
import 'package:thuri_cycle/infastructure/bloc_observer/bloc_observer.dart';
import 'package:thuri_cycle/infastructure/core/dependency_injection/di.dart';
import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';
import 'package:universal_platform/universal_platform.dart';

// Future<void> initFcmBackgroundMessage(RemoteMessage message) async {
//   //* If you're going to use other Firebase services in the background, such as Firestore,
//   //* make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   talker.verbose(
//     'initFcmBackgroundMessage() onMessage.listen: message.data: ${message.data}',
//   );

//   if (message.notification != null) {
//     talker.verbose(
//       'initFcmBackgroundMessage() onMessage.listen: message.notification: ${message.notification}',
//     );
//   }
// }

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = CustomBlocObserver();

  /* runZonedGuarded is function which is used to implement block of code within special zone. 
  his function helps you to handle any uncaught exceptions that may occur during the execution of that code.
  Refer this link for more info: https://medium.com/@gauravswarankar/runzonedguarded-function-in-flutter-d98537071bc4 */
  await runZonedGuarded<Future<void>>(
    () async {
      //! ---------- MAIN INIT CONFIG -------- //
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      //* PRESERVES splash screen until authentication complete.
      // TODO: If needed you can now keep the splash screen up while your app initializes! No need for a secondary splash screen anymore.
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      // TODO: If needed, uncommen
      // //! ---------- HIVE INIT CONFIG -------- //
      // await Hive.initFlutter();

      //! ---------- GET_IT INIT CONFIG -------- //
      //* CONFIGURES dependency injection to init modules and singletons.
      await configureDependencyInjection();

      // TODO: If needed, uncomment
      // if (UniversalPlatform.isAndroid) {
      //   //* INCREASES android devices preferred refresh rate to its maximum.
      //   await FlutterDisplayMode.setHighRefreshRate();
      // }

      if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
        //* SETS UP allowed device orientations and other settings for the app.
        await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
        );
      }

      //* SETS system overlay style.
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.top,
          SystemUiOverlay.bottom,
        ],
      );

      //! ---------- FIREBASE INIT CONFIG -------- //
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      //! ---------- FIREBASE MESSAGING CONFIG (IOS & WEB) -------- //
      // final messaging = FirebaseMessaging.instance;

      // unawaited(messaging.requestPermission());

      // if (UniversalPlatform.isAndroid) {
      //   unawaited(messaging.subscribeToTopic($constants.fcmTopicAndroid));
      // } else if (UniversalPlatform.isIOS) {
      //   unawaited(messaging.subscribeToTopic($constants.fcmTopicIos));
      // }

      // FirebaseMessaging.onBackgroundMessage(initFcmBackgroundMessage);

      // //! ---------- SENTRY INIT CONFIG -------- //
      // await initializeSentry();

      //! ---------- HYDRATED BLOC INIT CONFIG -------- //
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: UniversalPlatform.isWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory(
                (await getApplicationDocumentsDirectory()).path,
              ),
      );

      //TODO: Check whether following config is needed for Google Maps
      // //! ---------- GOOGLE MAPS CONFIG -------- //
      // if (UniversalPlatform.isAndroid) {
      //   AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
      // }
      // try {
      //   WidgetsFlutterBinding.ensureInitialized();
      //   cameras = await availableCameras();
      // } on CameraException catch (e) {
      //   talker
      //     ..error(e.code)
      //     ..error(e.description ?? 'No description found');
      // }

      return runApp(
        // //* Sentry's performance tracing for AssetBundles.
        // DefaultAssetBundle(
        //   bundle: SentryAssetBundle(),
        //   child:
        await builder(),
        // ),
      );
    },
    (error, stackTrace) async {
      talker.handle('bootstrap() runZonedGuarded() error: $error', stackTrace);
      // await Sentry.captureException(
      //   exception,
      //   stackTrace: stackTrace,
      // );
      debugPrintStack(stackTrace: stackTrace, label: error.toString());

      // // Optionally, following part can be used
      // FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    },
  );
}
