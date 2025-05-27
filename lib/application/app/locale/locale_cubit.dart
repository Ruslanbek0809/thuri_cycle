import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
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

  Future<void> initFcmToken() async {
    final firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.getToken().then(
      (fcmToken) async {
        if (fcmToken != null) {
          if (kDebugMode) {
            talker.warning('initFcmToken() getToken() fcmToken: $fcmToken');
          }

          await sharedPreferences.setString($constants.fcmToken, fcmToken);
        }
        return null;
      },
      onError: (dynamic err) {
        if (err != null) {
          talker.error(err);
        }
      },
    );

    //* Listen for token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((newFcmToken) async {
      if (kDebugMode) {
        talker.warning(
          'initFcmToken() onTokenRefresh newFcmToken: $newFcmToken',
        );
      }
      await sharedPreferences.setString($constants.fcmToken, newFcmToken);
    });
  }

  Future<void> initialMessage(BuildContext context) async {
    // final message = await FirebaseMessaging.instance.getInitialMessage();

    // if (message != null) {
    //   await handleNotificationPress(context, jsonEncode(message.data));
    // }
  }

  Future<void> initFcmForegroundMessage(BuildContext context) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      talker.warning(
        'initFcmForegroundMessage() onMessage.listen: message.data: ${message.data}',
      );

      if (message.notification != null) {
        talker.warning(
          'initFcmForegroundMessage() onMessage.listen: message.notification: ${message.notification}',
        );
        // showLocalNotificationWhileAppIsOpen(
        //   message.notification?.title ?? '',
        //   message.notification?.body ?? '',
        //   jsonEncode(message.data),
        //   context,
        // );
      }
    });
  }

  Future<void> initFcmNotificationPressedMessage(BuildContext context) async {
    //*When the app is in the background and opened directly from the push notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      talker.warning(
        'initFcmNotificationPressedMessage() onMessage.listen: message.data: ${message.data}',
      );

      // await handleNotificationPress(context, jsonEncode(message.data));

      if (message.notification != null) {
        talker.warning(
          'initFcmNotificationPressedMessage() onMessage.listen: message.notification: ${message.notification}',
        );
      }
    });
  }

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
