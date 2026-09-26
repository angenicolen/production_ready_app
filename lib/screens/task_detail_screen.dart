import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../services/task_service.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  const TaskDetailScreen({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        actions: [
          Semantics(
            label: 'Supprimer la tâche',
            button: true,
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<TaskService>().removeTask(task.id);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chip(
                  label: Text(
                    task.isCompleted ? 'Terminée' : 'En cours',
                  ),
                  backgroundColor: task.isCompleted
                      ? Colors.green.shade100
                      : Colors.orange.shade100,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Description :',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              task.description.isNotEmpty
                  ? task.description
                  : 'Aucune description fournie.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}