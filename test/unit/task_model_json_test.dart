import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/models/task.dart';

void main() {
  test('Verification de la representation String de Task', () {
    const task = Task(id: '1', title: 'Test Task', description: 'Desc');
    expect(task.toString(), contains('Test Task'));
  });
}
