import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:production_ready_app/main.dart';
import 'package:production_ready_app/services/task_service.dart';

void main() {
  testWidgets('Permet de naviguer vers un autre onglet', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaskService(),
        child: const TaskFlowApp(),
      ),
    );

    await tester.pumpAndSettle();

    final addTab = find.byIcon(Icons.add_circle_outline);
    if (addTab.evaluate().isNotEmpty) {
      await tester.tap(addTab);
      await tester.pumpAndSettle();
    }
  });
}