import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';

void main() {
  test('Valeur par defaut de isCompleted est false', () {
    const task = Task(id: '1', title: 'Test Task', description: 'Desc');
    expect(task.isCompleted, isFalse);
  });
}
