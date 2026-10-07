import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';

void main() {
  test('Copie de Task avec modification de isCompleted', () {
    const task = Task(id: '1', title: 'Test Task', description: 'Desc');
    final updated = task.copyWith(isCompleted: true);
    expect(updated.isCompleted, isTrue);
  });
}
