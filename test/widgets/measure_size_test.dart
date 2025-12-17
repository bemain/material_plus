import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  testWidgets('MeasureSize calls onSizeChanged', (tester) async {
    Size? measured;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MeasureSize(
            onSizeChanged: (s) => measured = s,
            child: const SizedBox(width: 10, height: 20),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(measured, isNotNull);
  });
}
