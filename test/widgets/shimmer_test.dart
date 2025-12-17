import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_plus/material_plus.dart';

void main() {
  const gradient = LinearGradient(
    colors: [Colors.black12, Colors.white, Colors.black12],
  );

  testWidgets('Shimmer builds with child', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Shimmer(gradient: gradient, child: const Text('Loading')),
        ),
      ),
    );
    expect(find.text('Loading'), findsOneWidget);
  });

  testWidgets('TextPlaceholder builds under Shimmer', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const Shimmer(
            gradient: gradient,
            child: TextPlaceholder(width: 50),
          ),
        ),
      ),
    );
    expect(find.byType(TextPlaceholder), findsOneWidget);
  });

  testWidgets('IconPlaceholder builds under Shimmer', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const Shimmer(
            gradient: gradient,
            child: IconPlaceholder(size: 24),
          ),
        ),
      ),
    );
    expect(find.byType(IconPlaceholder), findsOneWidget);
  });
}
