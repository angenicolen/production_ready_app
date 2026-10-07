import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';
import 'package:production_ready_app/services/task_service.dart';

void main() {
  test('TaskService bascule l etat d une tache', () {
    final service = TaskService();
    service.addTask(const Task(id: '1', title: 'New Task', description: 'Desc'));
    service.toggleTask('1');
    expect(service.tasks.first.isCompleted, isTrue);
  });
}
