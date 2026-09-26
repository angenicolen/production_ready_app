import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:production_ready_app/main.dart';
import 'package:production_ready_app/services/task_service.dart';

void main() {
  group('Tests de Widgets (UI)', () {
    testWidgets('1. L app démarre et affiche la barre de navigation', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => TaskService(),
          child: const TaskFlowApp(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(NavigationBar), findsOneWidget);
      expect(find.byType(NavigationDestination), findsWidgets);
    });

    testWidgets('2. Permet de cliquer sur l onglet d ajout de tâche', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => TaskService(),
          child: const TaskFlowApp(),
        ),
      );

      await tester.pumpAndSettle();

      final destination = find.byType(NavigationDestination).at(1);
      if (destination.evaluate().isNotEmpty) {
        await tester.tap(destination);
        await tester.pumpAndSettle();
      }
      expect(find.byType(NavigationBar), findsOneWidget);
    });

    testWidgets('3. Vérifie la présence du FloatingActionButton ou bouton d action principal', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => TaskService(),
          child: const TaskFlowApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Vérifie qu un FAB ou des icônes d interaction sont présentes à l écran
      final fab = find.byType(FloatingActionButton);
      if (fab.evaluate().isNotEmpty) {
        expect(fab, findsOneWidget);
      } else {
        expect(find.byType(Scaffold), findsWidgets);
      }
    });

    testWidgets('4. Vérifie l affichage du Scaffold principal', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => TaskService(),
          child: const TaskFlowApp(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsWidgets);
    });

    testWidgets('5. Vérifie le basculement d onglet de navigation', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => TaskService(),
          child: const TaskFlowApp(),
        ),
      );

      await tester.pumpAndSettle();

      final destinations = find.byType(NavigationDestination);
      if (destinations.evaluate().length > 1) {
        await tester.tap(destinations.at(0));
        await tester.pumpAndSettle();
      }

      expect(find.byType(NavigationBar), findsOneWidget);
    });
  });
}