import 'dart:ui';

class AppTexts {
  static String title(Locale locale) =>
      locale.languageCode == 'en' ? 'TaskFlow' : 'TaskFlow';

  static String home(Locale locale) =>
      locale.languageCode == 'en' ? 'Home' : 'Accueil';

  static String tasks(Locale locale) =>
      locale.languageCode == 'en' ? 'Tasks' : 'Tâches';

  static String add(Locale locale) =>
      locale.languageCode == 'en' ? 'Add' : 'Ajouter';

  static String statistics(Locale locale) =>
      locale.languageCode == 'en' ? 'Statistics' : 'Statistiques';

  static String settings(Locale locale) =>
      locale.languageCode == 'en' ? 'Settings' : 'Paramètres';

  static String welcome(Locale locale) => locale.languageCode == 'en'
      ? 'Welcome to TaskFlow'
      : 'Bienvenue sur TaskFlow';

  static String subtitle(Locale locale) => locale.languageCode == 'en'
      ? 'Organize your tasks simply and efficiently.'
      : 'Organisez vos tâches simplement et efficacement.';

  static String myTasks(Locale locale) =>
      locale.languageCode == 'en' ? 'My tasks' : 'Mes tâches';

  static String addTask(Locale locale) =>
      locale.languageCode == 'en' ? 'Add a task' : 'Ajouter une tâche';

  static String taskList(Locale locale) =>
      locale.languageCode == 'en' ? 'Task list' : 'Liste des tâches';

  static String statisticsTitle(Locale locale) => locale.languageCode == 'en'
      ? 'Task statistics'
      : 'Statistiques des tâches';

  static String settingsTitle(Locale locale) => locale.languageCode == 'en'
      ? 'Application settings'
      : "Paramètres de l'application";
}