import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/main.dart';

void main() {
  testWidgets('affiche le titre TaskFlow', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('TaskFlow'), findsOneWidget);
  });

  testWidgets('affiche le message de bienvenue', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(
      find.text('Bienvenue sur TaskFlow'),
      findsOneWidget,
    );
  });

  testWidgets('affiche la navigation Accueil', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('Accueil'), findsOneWidget);
  });

  testWidgets('permet d ouvrir l écran des tâches', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    await tester.tap(find.text('Tâches'));
    await tester.pump();

    expect(find.text('Mes tâches'), findsOneWidget);
  });

  testWidgets('permet d ouvrir l écran Ajouter', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    await tester.tap(find.text('Ajouter'));
    await tester.pump();

    expect(find.text('Ajouter une tâche'), findsOneWidget);
  });
}