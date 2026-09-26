import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskService with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners(); // Informe l'application de la modification
  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners(); // Informe l'application de la modification
  }

  void toggleTask(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);

    if (index != -1) {
      final task = _tasks[index];

      _tasks[index] = task.copyWith(
        isCompleted: !task.isCompleted,
      );
      notifyListeners(); // Informe l'application de la modification
    }
  }

  int get completedCount {
    return _tasks.where((task) => task.isCompleted).length;
  }

  int get pendingCount {
    return _tasks.where((task) => !task.isCompleted).length;
  }
}