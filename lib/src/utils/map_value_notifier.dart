import 'package:flutter/material.dart';

extension MapValueNotifierExtension<T> on ValueNotifier<T> {
  /// Create a new [ValueNotifier] by passing each value that this receives
  /// through the [convert] method and then feeding that to the notifier.
  ValueNotifier<S> map<S>(S Function(T) convert) {
    final ValueNotifier<S> notifier = ValueNotifier<S>(convert(value));
    addListener(() => notifier.value = convert(value));
    return notifier;
  }
}
