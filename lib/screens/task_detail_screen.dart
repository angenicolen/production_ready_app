import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              label: 'Titre de la tâche',
              child: Text(
                task.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 12),
            Semantics(
              label: 'Description de la tâche',
              child: Text(
                task.description.isEmpty 
                    ? 'Aucune description fournie.' 
                    : task.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Icon(
                  task.isCompleted 
                      ? Icons.check_circle 
                      : Icons.pending,
                  color: task.isCompleted ? Colors.green : Colors.orange,
                ),
                const SizedBox(width: 8),
                Text(
                  task.isCompleted 
                      ? 'Statut : Terminée' 
                      : 'Statut : En cours',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}