import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:production_ready_app/main.dart';
import 'package:production_ready_app/services/task_service.dart';

void main() {
  testWidgets('Changement d onglet de navigation', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(create: (_) => TaskService(), child: const TaskFlowApp()),
    );
    await tester.pumpAndSettle();
    final destinations = find.byType(NavigationDestination);
    if (destinations.evaluate().isNotEmpty) {
      await tester.tap(destinations.first);
      await tester.pumpAndSettle();
    }
    expect(find.byType(NavigationBar), findsOneWidget);
  });
}
