import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  testWidgets('NumberField submits parsed value', (tester) async {
    int? submitted;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NumberField<int>(onSubmitted: (v) => submitted = v),
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), '42');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(submitted, 42);
  });
}
