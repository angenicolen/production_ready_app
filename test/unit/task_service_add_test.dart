import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';
import 'package:production_ready_app/services/task_service.dart';

void main() {
  test('TaskService ajoute une tache', () {
    final service = TaskService();
    service.addTask(const Task(id: '1', title: 'New Task', description: 'Desc'));
    expect(service.tasks.length, 1);
  });
}
