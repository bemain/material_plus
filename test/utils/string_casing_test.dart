import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  group('StringCasingExtension', () {
    test('toTitleCase', () {
      expect('hello world'.toTitleCase(), 'Hello World');
      expect('  multiple   spaces '.toTitleCase(), ' Multiple Spaces ');
    });
  });
}
