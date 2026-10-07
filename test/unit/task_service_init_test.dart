import 'package:flutter_test/flutter_test.dart';
import 'package:production_ready_app/services/task_service.dart';

void main() {
  test('TaskService s initialise correctement', () {
    final service = TaskService();
    expect(service.tasks, isNotNull);
  });
}
