import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  testWidgets('SpeedDial builds', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: SpeedDial(
            children: const [
              SpeedDialAction(child: Icon(Icons.add), label: Text('Add')),
            ],
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
    expect(find.byType(SpeedDial), findsOneWidget);
  });
}
