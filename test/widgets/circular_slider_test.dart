import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  testWidgets('CircularSlider builds', (tester) async {
    double value = 0.5;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircularSlider(value: value, onChanged: (v) => value = v),
        ),
      ),
    );
    expect(find.byType(CircularSlider), findsOneWidget);
  });
}
