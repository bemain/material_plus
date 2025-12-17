import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  testWidgets('AlertSheet builds', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AlertSheet(
            title: const Text('Title'),
            content: const Text('Content'),
            actions: const [Text('OK')],
          ),
        ),
      ),
    );
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Content'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
  });
}
