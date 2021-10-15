import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tower_block_test/widget/project/dialog.dart';

void main() {
  testWidgets('test dialog total time', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DialogWG(timeUse: 12),
      ),
    );

    expect(find.text('TOTAL TIME'), findsOneWidget);
    expect(find.text('12 S'), findsOneWidget);
    expect(find.text('PLAY AGAIN'), findsOneWidget);
  });
}
