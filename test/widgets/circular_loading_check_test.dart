import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  testWidgets('CircularLoadingCheck shows progress then check', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: CircularLoadingCheck(progress: null)),
      ),
    );
    expect(find.byKey(const ValueKey('progress_indicator')), findsOneWidget);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: CircularLoadingCheck(isComplete: true)),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('check_icon')), findsOneWidget);
  });
}
