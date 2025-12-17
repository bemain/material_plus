import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  testWidgets('ContinuousButton builds', (tester) async {
    int calls = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ContinuousButton(
            onContinuousPress: () => calls++,
            child: const Text('Hold'),
          ),
        ),
      ),
    );
    expect(find.text('Hold'), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 1));
  });
}
