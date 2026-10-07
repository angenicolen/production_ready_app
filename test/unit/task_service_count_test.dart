import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';
import 'package:production_ready_app/services/task_service.dart';

void main() {
  test('TaskService compte les taches completees', () {
    final service = TaskService();
    service.addTask(const Task(id: '1', title: 'Task 1', description: 'Desc'));
    service.toggleTask('1');
    expect(service.completedCount, 1);
  });
}
