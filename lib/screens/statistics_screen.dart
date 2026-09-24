import 'package:flutter/material.dart';

import '../services/task_service.dart';
import '../localization/app_texts.dart';

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