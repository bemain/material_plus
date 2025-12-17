import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  group('ListNotifier', () {
    test('add/remove notifies and updates', () {
      final ln = ListNotifier<int>([]);
      expect(ln.value, isEmpty);
      ln.add(1);
      expect(ln.value, [1]);
      ln.remove(1);
      expect(ln.value, isEmpty);
    });

    test('index operator updates and notifies', () {
      final ln = ListNotifier<int>([0, 1, 2]);
      ln[1] = 42;
      expect(ln.value[1], 42);
    });
  });
}
