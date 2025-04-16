// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:thuri_cycle/presentation/core/utils/methods/aliases.dart';

// part 'alert_model.freezed.dart';

// enum AlertType {
//   constructive,
//   destructive,
//   error,
//   notification,
//   exception,
//   quiet
// }

// @freezed
// class AlertModel with _$AlertModel {
//   const factory AlertModel({
//     required String message,
//     required AlertType type,
//     @Default(false) bool translatable,
//     int? code,
//   }) = _AlertModel;

//   factory AlertModel.alert({
//     required String message,
//     required AlertType type,
//     bool translatable = false,
//     int? code,
//   }) {
//     if (type == AlertType.error) {
//       talker.error(message);
//     }

//     return AlertModel(
//       message: message,
//       type: type,
//       translatable: translatable,
//       code: code,
//     );
//   }

//   factory AlertModel.exception({
//     required String message,
//     bool isTest = false,
//     StackTrace? stackTrace,
//   }) {
//     if (isTest) {
//       talker.handle('AlertModel.exception() message: $message', stackTrace);
//       // logIt.error (message, stackTrace: stackTrace);
//     }

//     return AlertModel(
//       message: message,
//       type: AlertType.exception,
//     );
//   }

//   factory AlertModel.initial() =>
//       AlertModel.alert(message: '', type: AlertType.quiet);

//   factory AlertModel.quiet() {
//     return const AlertModel(
//       message: '',
//       type: AlertType.quiet,
//     );
//   }
// }
