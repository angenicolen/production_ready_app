import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/main.dart';

void main() {
  testWidgets('TaskFlow affiche le titre', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('TaskFlow'), findsOneWidget);
  });
}