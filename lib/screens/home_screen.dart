import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../localization/app_texts.dart';
import '../services/task_service.dart';
import 'package:production_ready_app/app_texts.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    // Écoute le TaskService fourni par Provider
    final taskService = context.watch<TaskService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.title(locale)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.welcome(locale),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 12),
            Text(
              AppTexts.subtitle(locale),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.task_alt,
                      size: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppTexts.myTasks(locale),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${taskService.pendingCount} ${locale.languageCode == 'en' ? 'task(s) pending' : 'tâche(s) en cours'}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}