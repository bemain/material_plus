import 'package:flutter/material.dart';

class CircularLoadingCheck extends StatelessWidget {
  /// The progress of this indicator.
  ///
  /// A value of 0.0 means no progress and 1.0 means that progress is complete.
  /// The value will be clamped to be in the range 0.0-1.0.
  ///
  /// If `null`, this progress indicator is indeterminate, which means the
  /// indicator displays a predetermined animation that does not indicate how
  /// much actual progress is being made; similar to a [CircularProgressIndicator].
  final double? progress;

  /// Whether this should show the checkmark that indicates it is completed.
  final bool isComplete;

  /// The diameter of the indicator.
  final double size;

  /// A circular loading indicator that turns into a checkmark when completed.
  const CircularLoadingCheck({
    super.key,
    this.progress,
    this.isComplete = false,
    this.size = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: isComplete
            ? Icon(
                Icons.check_rounded,
                key: const ValueKey("check_icon"),
                size: size * 0.8,
                color: Theme.of(context).colorScheme.primary,
              )
            : CircularProgressIndicator(
                key: const ValueKey("progress_indicator"),
                constraints: BoxConstraints(minHeight: size, minWidth: size),
                value: progress,
              ),
      ),
    );
  }
}
