import 'package:flutter/material.dart';

class SnackBarHelper {
  /// Get a success notification flushbar.
  static SnackBar createSuccess({
    required String message,
    String? title,
    String? snackBarPosition = 'bottom',
    Duration duration = const Duration(seconds: 3),
  }) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.check_circle,
            size: 28,
            color: Colors.green[300],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                Text(
                  message,
                  style: const TextStyle(
                    height: 1.1,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF303030),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      // margin: snackBarPosition == 'top'
      //     ? EdgeInsets.only(
      //         bottom: getTabletType() ? 90 : 60,
      //         left: $constants.insets.sm,
      //         right: $constants.insets.sm,
      //       )
      //     : null,
    );
  }

  /// Get an information notification flushbar
  static SnackBar createInformation({
    required String message,
    String? title,
    String? snackBarPosition = 'bottom',
    Duration duration = const Duration(seconds: 3),
  }) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.info_outline,
            size: 28,
            color: Colors.blue[300],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                Text(
                  message,
                  style: const TextStyle(
                    height: 1.1,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF303030),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      // margin: snackBarPosition == 'top'
      //     ? EdgeInsets.only(
      //         bottom: getTabletType() ? 90 : 60,
      //         left: $constants.insets.sm,
      //         right: $constants.insets.sm,
      //       )
      //     : null,
    );
  }

  /// Get a error notification flushbar
  static SnackBar createError({
    required String message,
    String? title,
    String? snackBarPosition = 'bottom',
    Duration duration = const Duration(seconds: 3),
  }) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.warning,
            size: 28,
            color: Colors.red[300],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                Text(
                  message,
                  style: const TextStyle(
                    height: 1.1,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF303030),
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );
  }
}
