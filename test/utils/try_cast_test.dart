import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  group('tryCast', () {
    test('successful cast', () {
      final num x = 5;
      final int? y = tryCast<int>(x);
      expect(y, 5);
    });

    test('failed cast returns null', () {
      final num x = 5;
      final String? y = tryCast<String>(x);
      expect(y, isNull);
    });
  });
}
