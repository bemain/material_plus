import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  testWidgets('SegmentedTabControl builds with two tabs', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: SegmentedTabControl(
                tabs: const [
                  SegmentTab(text: 'One'),
                  SegmentTab(text: 'Two'),
                ],
              ),
            ),
            body: const TabBarView(children: [Text('A'), Text('B')]),
          ),
        ),
      ),
    );
    expect(find.text('One'), findsOneWidget);
    expect(find.text('Two'), findsOneWidget);
  });
}
