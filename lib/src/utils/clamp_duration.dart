extension ClampDurationExtension on Duration {
  /// Clamp this to between [lowerLimit] and [upperLimit].
  Duration clamp(Duration lowerLimit, Duration upperLimit) {
    return Duration(
      microseconds: inMicroseconds.clamp(
        lowerLimit.inMicroseconds,
        upperLimit.inMicroseconds,
      ),
    );
  }
}
