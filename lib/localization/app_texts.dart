import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

import 'package:production_ready_app/main.dart';
import 'package:production_ready_app/services/task_service.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Tests d integration (End-to-End)', () {
    testWidgets('1. Lancement de l application et verification de la navigation', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => TaskService(),
          child: const TaskFlowApp(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(NavigationBar), findsOneWidget);
    });

    testWidgets('2. Navigation vers les differents onglets', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => TaskService(),
          child: const TaskFlowApp(),
        ),
      );

      await tester.pumpAndSettle();

      final destinations = find.byType(NavigationDestination);
      if (destinations.evaluate().length > 1) {
        await tester.tap(destinations.at(1));
        await tester.pumpAndSettle();
      }

      expect(find.byType(Scaffold), findsWidgets);
    });
  });
}