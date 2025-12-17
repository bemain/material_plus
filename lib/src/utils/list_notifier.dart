import 'dart:collection';

import 'package:flutter/material.dart';

class ListNotifier<T> extends ValueNotifier<List<T>> {
  ListNotifier(super._value);

  @override
  UnmodifiableListView<T> get value => UnmodifiableListView(super.value);
  @override
  set value(List<T> newValue) {
    super.value = UnmodifiableListView<T>(newValue);
  }

  T operator [](int index) => super.value[index];
  void operator []=(int index, T value) {
    super.value[index] = value;
    notifyListeners();
  }

  void add(T element) {
    super.value.add(element);
    notifyListeners();
  }

  void addAll(Iterable<T> iterable) {
    super.value.addAll(iterable);
    notifyListeners();
  }

  bool remove(T element) {
    final ret = super.value.remove(element);
    notifyListeners();
    return ret;
  }

  T removeAt(int index) {
    final ret = super.value.removeAt(index);
    notifyListeners();
    return ret;
  }

  void clear() {
    super.value.clear();
    notifyListeners();
  }
}
