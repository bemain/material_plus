import 'dart:async';

import 'package:flutter/material.dart';

class ContinuousButton extends StatelessWidget {
  /// Button that can be held down to yield continuous presses.
  const ContinuousButton({
    super.key,
    required this.onContinuousPress,
    this.onContinuousPressEnd,
    this.interval = const Duration(milliseconds: 100),
    required this.child,
  });

  /// Callback for when this button is pressed.
  final void Function()? onContinuousPress;

  /// Callback for when the user stops pressing this button.
  final void Function()? onContinuousPressEnd;

  /// Interval between callbacks if the button is held pressed.
  final Duration interval;

  /// The child of this widget. Typically a [ButtonStyleButton].
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(const Duration(), () {});
    return GestureDetector(
      onLongPressStart: (details) {
        timer = Timer.periodic(interval, (_) => onContinuousPress?.call());
      },
      onLongPressUp: () {
        timer.cancel();
        onContinuousPressEnd?.call();
      },
      onLongPressCancel: () {
        timer.cancel();
        onContinuousPressEnd?.call();
      },
      child: child,
    );
  }
}
