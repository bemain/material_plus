import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

class TestProcess extends Process<int> {
  @override
  Future<int> execute() async {
    await Future<void>.delayed(const Duration(milliseconds: 10));
    return 1;
  }
}

void main() {
  group('Process', () {
    test('start and complete process', () async {
      final p = TestProcess();
      expect(p.isActive, isTrue);
      final result = await p.future;
      expect(result, 1);
      expect(p.isComplete, isTrue);
      expect(p.hasError, isFalse);
    });
  });
}
