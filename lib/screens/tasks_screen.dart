import 'package:flutter/material.dart';

import '../localization/app_texts.dart';
import '../services/task_service.dart';

class TasksScreen extends StatefulWidget {
  final TaskService taskService;

  const TasksScreen({
    super.key,
    required this.taskService,
  });

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final tasks = widget.taskService.tasks;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.myTasks(locale)),
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text(
                locale.languageCode == 'en'
                    ? 'No tasks yet.'
                    : 'Aucune tâche pour le moment.',
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) {
                      setState(() {
                        widget.taskService.toggleTask(task.id);
                      });
                    },
                  ),
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: Semantics(
                    label: locale.languageCode == 'en'
                        ? 'Delete task'
                        : 'Supprimer la tâche',
                    button: true,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.taskService.removeTask(task.id);
                        });
                      },
                      icon: const Icon(Icons.delete_outline),
                      tooltip: locale.languageCode == 'en'
                          ? 'Delete'
                          : 'Supprimer',
                    ),
                  ),
                );
              },
            ),
    );
  }
}