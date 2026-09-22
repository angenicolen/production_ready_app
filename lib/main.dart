import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/task.dart';
import 'services/task_service.dart';
import 'localization/app_texts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TaskFlowApp());
}

class TaskFlowApp extends StatefulWidget {
  const TaskFlowApp({super.key});

  @override
  State<TaskFlowApp> createState() => _TaskFlowAppState();
}

class _TaskFlowAppState extends State<TaskFlowApp> {
  Locale _locale = const Locale('fr');

  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskFlow',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [
        Locale('fr'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: MainNavigation(
        onLanguageChanged: changeLanguage,
      ),
    );
  }
}
class MainNavigation extends StatefulWidget {
  final ValueChanged<Locale> onLanguageChanged;

  const MainNavigation({
    super.key,
    required this.onLanguageChanged,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final TaskService _taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(taskService: _taskService),
          TasksScreen(taskService: _taskService),
          AddTaskScreen(
            taskService: _taskService,
            onTaskAdded: () {
              setState(() {});
            },
          ),
          StatisticsScreen(taskService: _taskService),
          SettingsScreen(
            onLanguageChanged: widget.onLanguageChanged,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: AppTexts.home(locale),
          ),
          NavigationDestination(
            icon: const Icon(Icons.checklist_outlined),
            selectedIcon: const Icon(Icons.checklist),
            label: AppTexts.tasks(locale),
          ),
          NavigationDestination(
            icon: const Icon(Icons.add_circle_outline),
            selectedIcon: const Icon(Icons.add_circle),
            label: AppTexts.add(locale),
          ),
          NavigationDestination(
            icon: const Icon(Icons.bar_chart_outlined),
            selectedIcon: const Icon(Icons.bar_chart),
            label: AppTexts.statistics(locale),
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: AppTexts.settings(locale),
          ),
        ],
      ),
    );
  }
}

class TasksScreen extends StatelessWidget {
  final TaskService taskService;

  const TasksScreen({
    super.key,
    required this.taskService,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final tasks = taskService.tasks;

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
                      taskService.toggleTask(task.id);
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
      taskService.removeTask(task.id);
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

class StatisticsScreen extends StatelessWidget {
  final TaskService taskService;

  const StatisticsScreen({
    super.key,
    required this.taskService,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.statisticsTitle(locale)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${locale.languageCode == 'en' ? 'Total' : 'Total'} : ${taskService.tasks.length}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              '${locale.languageCode == 'en' ? 'Completed' : 'Terminées'} : ${taskService.completedCount}',
            ),
            const SizedBox(height: 8),
            Text(
              '${locale.languageCode == 'en' ? 'Pending' : 'En cours'} : ${taskService.pendingCount}',
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  final ValueChanged<Locale> onLanguageChanged;

  const SettingsScreen({
    super.key,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.settingsTitle(locale)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(
              Icons.language,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              locale.languageCode == 'en'
                  ? 'Choose your language'
                  : 'Choisissez votre langue',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            ListTile(
              title: const Text('Français'),
              leading: const Icon(Icons.language),
              trailing: locale.languageCode == 'fr'
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                onLanguageChanged(const Locale('fr'));
              },
            ),
            ListTile(
              title: const Text('English'),
              leading: const Icon(Icons.language),
              trailing: locale.languageCode == 'en'
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                onLanguageChanged(const Locale('en'));
              },
            ),
          ],
        ),
      ),
    );
  }
}