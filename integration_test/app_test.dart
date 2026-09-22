import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:production_ready_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Parcours utilisateur : accueil vers tâches', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TaskFlowApp());

    // Vérifier l'accueil
    expect(find.text('Bienvenue sur TaskFlow'), findsOneWidget);

    // Aller vers l'écran Tâches
    await tester.tap(find.text('Tâches'));
    await tester.pumpAndSettle();

    // Vérifier l'écran Tâches
    expect(find.text('Mes tâches'), findsOneWidget);
  });

  testWidgets('Parcours utilisateur : accueil vers ajout de tâche', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TaskFlowApp());

    // Vérifier l'accueil
    expect(find.text('Bienvenue sur TaskFlow'), findsOneWidget);

    // Aller vers l'écran Ajouter
    await tester.tap(find.text('Ajouter'));
    await tester.pumpAndSettle();

    // Vérifier l'écran d'ajout
    expect(find.text('Ajouter une tâche'), findsOneWidget);
  });
}