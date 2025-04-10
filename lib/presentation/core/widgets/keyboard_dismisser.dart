import 'package:flutter/material.dart';

class KeyboardDismisserWidget extends StatelessWidget {
  const KeyboardDismisserWidget({
    required this.child,
    this.onTap,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
