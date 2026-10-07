import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';

void main() {
  test('Instanciation correcte de la classe Task', () {
    const task = Task(id: '1', title: 'Test Task', description: 'Desc');
    expect(task.id, '1');
    expect(task.title, 'Test Task');
  });
}
