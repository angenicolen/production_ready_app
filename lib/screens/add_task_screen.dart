import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/task_service.dart';
import '../localization/app_texts.dart';

class AddTaskScreen extends StatefulWidget {
  final TaskService taskService;
  final VoidCallback onTaskAdded;

  const AddTaskScreen({
    super.key,
    required this.taskService,
    required this.onTaskAdded,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addTask() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    widget.taskService.addTask(task);
    widget.onTaskAdded();

    _titleController.clear();
    _descriptionController.clear();

    final locale = Localizations.localeOf(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          locale.languageCode == 'en'
              ? 'Task added successfully'
              : 'Tâche ajoutée avec succès',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.addTask(locale)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: locale.languageCode == 'en'
                      ? 'Title'
                      : 'Titre',
                  hintText: locale.languageCode == 'en'
                      ? 'Ex. Study Flutter'
                      : 'Ex. Réviser Flutter',
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return locale.languageCode == 'en'
                        ? 'Title is required'
                        : 'Le titre est obligatoire';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: locale.languageCode == 'en'
                      ? 'Description'
                      : 'Description',
                  hintText: locale.languageCode == 'en'
                      ? 'Describe your task'
                      : 'Décrivez votre tâche',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _addTask,
                icon: const Icon(Icons.add),
                label: Text(
                  locale.languageCode == 'en'
                      ? 'Add task'
                      : 'Ajouter la tâche',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
