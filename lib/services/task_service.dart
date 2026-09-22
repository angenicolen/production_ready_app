import '../models/task.dart';

class TaskService {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(Task task) {
    _tasks.add(task);
  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
  }

  void toggleTask(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);

    if (index != -1) {
      final task = _tasks[index];

      _tasks[index] = task.copyWith(
        isCompleted: !task.isCompleted,
      );
    }
  }

  int get completedCount {
    return _tasks.where((task) => task.isCompleted).length;
  }

  int get pendingCount {
    return _tasks.where((task) => !task.isCompleted).length;
  }
}