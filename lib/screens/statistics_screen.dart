import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/task_service.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskService = context.watch<TaskService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Statistiques')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tâches terminées: ${taskService.completedCount}'),
            Text('Tâches en cours: ${taskService.pendingCount}'),
          ],
        ),
      ),
    );
  }
}