import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';

void main() {
  group('Task', () {
    test('crée une tâche non terminée par défaut', () {
      const task = Task(
        id: '1',
        title: 'Test',
        description: 'Description',
      );

      expect(task.isCompleted, isFalse);
    });

    test('crée une tâche terminée', () {
      const task = Task(
        id: '1',
        title: 'Test',
        description: 'Description',
        isCompleted: true,
      );

      expect(task.isCompleted, isTrue);
    });

    test('conserve les informations de la tâche', () {
      const task = Task(
        id: '1',
        title: 'Réviser',
        description: 'Réviser Flutter',
      );

      expect(task.id, '1');
      expect(task.title, 'Réviser');
      expect(task.description, 'Réviser Flutter');
    });

    test('copyWith modifie le titre', () {
      const task = Task(
        id: '1',
        title: 'Ancien titre',
        description: 'Description',
      );

      final updatedTask = task.copyWith(title: 'Nouveau titre');

      expect(updatedTask.title, 'Nouveau titre');
      expect(updatedTask.id, '1');
      expect(updatedTask.description, 'Description');
    });

    test('copyWith modifie le statut', () {
      const task = Task(
        id: '1',
        title: 'Test',
        description: 'Description',
      );

      final updatedTask = task.copyWith(isCompleted: true);

      expect(updatedTask.isCompleted, isTrue);
      expect(updatedTask.title, 'Test');
    });
  });
}