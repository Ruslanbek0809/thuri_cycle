import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Injectable module for Talker setup
@module
abstract class TalkerModule {
  @singleton
  Talker get talkerFlutter => TalkerFlutter.init(
        settings: TalkerSettings(
            // enabled: true,
            // useHistory: true,
            // maxHistoryItems: 200,
            // useConsoleLogs: true,
            // colors: {
            //   TalkerLogType.httpResponse.key: AnsiPen()..red(),
            //   TalkerLogType.error.key: AnsiPen()..green(),
            //   'custom_log_key': AnsiPen()..yellow(),
            // },
            // titles: {
            //   TalkerLogType.exception.key: 'Exception!',
            //   TalkerLogType.error.key: 'Error',
            //   TalkerLogType.info.key: 'Info',
            //   'custom_log_key': 'Custom Log',
            // },
            ),
        // observer: CustomTalkerObserver(),
      );
}

// /// Custom Talker Observer to integrate logging into external services like Sentry
// class CustomTalkerObserver extends TalkerObserver {
//   @override
//   void onError(TalkerError err) {
//     super.onError(err);
//     // Example: Send error to Sentry
//     // Sentry.captureException(err);
//   }

//   @override
//   void onException(TalkerException exception) {
//     super.onException(exception);
//     // Example: Send exception to an external system
//   }

//   @override
//   void onLog(TalkerDataInterface log) {
//     super.onLog(log);
//     // Example: Send logs to a monitoring system
//   }
// }
