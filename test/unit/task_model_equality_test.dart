import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';

void main() {
  test('Egalite de deux objets Task identiques', () {
    const task1 = Task(id: '1', title: 'Test', description: 'Desc');
    const task2 = Task(id: '1', title: 'Test', description: 'Desc');
    expect(task1, equals(task2));
  });
}
