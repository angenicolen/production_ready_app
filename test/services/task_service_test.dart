import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';
import 'package:production_ready_app/services/task_service.dart';

void main() {
  group('TaskService', () {
    test('ajoute une tâche', () {
      final service = TaskService();

      const task = Task(
        id: '1',
        title: 'Réviser Flutter',
        description: 'Préparer le projet final',
      );

      service.addTask(task);

      expect(service.tasks.length, 1);
      expect(service.tasks.first.title, 'Réviser Flutter');
    });

    test('supprime une tâche', () {
      final service = TaskService();

      const task = Task(
        id: '1',
        title: 'Réviser Flutter',
        description: 'Préparer le projet final',
      );

      service.addTask(task);
      service.removeTask('1');

      expect(service.tasks, isEmpty);
    });

    test('marque une tâche comme terminée', () {
      final service = TaskService();

      const task = Task(
        id: '1',
        title: 'Réviser Flutter',
        description: 'Préparer le projet final',
      );

      service.addTask(task);
      service.toggleTask('1');

      expect(service.tasks.first.isCompleted, isTrue);
    });

    test('compte les tâches terminées', () {
      final service = TaskService();

      service.addTask(
        const Task(
          id: '1',
          title: 'Tâche 1',
          description: 'Description',
        ),
      );

      service.addTask(
        const Task(
          id: '2',
          title: 'Tâche 2',
          description: 'Description',
        ),
      );

      service.toggleTask('1');

      expect(service.completedCount, 1);
    });

    test('compte les tâches en attente', () {
      final service = TaskService();

      service.addTask(
        const Task(
          id: '1',
          title: 'Tâche 1',
          description: 'Description',
        ),
      );

      service.addTask(
        const Task(
          id: '2',
          title: 'Tâche 2',
          description: 'Description',
        ),
      );

      service.toggleTask('1');

      expect(service.pendingCount, 1);
    });
  });
}