import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/task_service.dart';
import 'task_detail_screen.dart'; // Import de l'écran de détails

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskService = context.watch<TaskService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Tâches')),
      body: taskService.tasks.isEmpty
          ? const Center(child: Text('Aucune tâche disponible.'))
          : ListView.builder(
              itemCount: taskService.tasks.length,
              itemBuilder: (context, index) {
                final task = taskService.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(
                    task.description.isNotEmpty
                        ? task.description
                        : 'Pas de description',
                  ),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) => taskService.toggleTask(task.id),
                  ),
                  // Quand on clique sur l'élément de la liste :
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TaskDetailScreen(task: task),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}