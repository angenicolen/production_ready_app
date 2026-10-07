# TaskFlow ??

[![Flutter CI](https://github.com/angenicolen/production_ready_app/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/angenicolen/production_ready_app/actions/workflows/flutter_ci.yml)

TaskFlow est une application Flutter de gestion de tâches conçue avec une approche orientée vers la qualité, les tests et la préparation à la production.

## Fonctionnalités

- Affichage d'un tableau de bord d'accueil
- Création et consultation détaillée des tâches
- Affichage de la liste des tâches
- Marquage d'une tâche comme terminée ou non terminée
- Suppression de tâches
- Statistiques sur les tâches terminées et en attente
- Changement de langue entre français et anglais
- Navigation fluide entre tous les écrans
- Validation des formulaires
- Support de l'accessibilité avec des labels sémantiques (\Semantics\)
- Optimisation des rendus grâce aux widgets \const\ et au pattern \Provider\

## Écrans

L'application contient les écrans principaux :

1. Accueil (\HomeScreen\)
2. Mes tâches (\TasksScreen\)
3. Détail de la tâche (\TaskDetailScreen\)
4. Ajouter une tâche (\AddTaskScreen\)
5. Statistiques (\StatisticsScreen\)
6. Paramètres (\SettingsScreen\)

## Architecture

Le projet utilise une structure orientée par couches (Layer-first) :

\\\	ext
lib/
+-- main.dart
+-- constants/
¦   +-- app_texts.dart
+-- models/
¦   +-- task.dart
+-- screens/
¦   +-- home_screen.dart
¦   +-- tasks_screen.dart
¦   +-- task_detail_screen.dart
¦   +-- add_task_screen.dart
¦   +-- statistics_screen.dart
¦   +-- settings_screen.dart
+-- services/
    +-- task_service.dart
\\\

- \pp_texts.dart\ contient les textes et traductions pour le français et l'anglais.
- \models/\ contient le modèle de données \Task\.
- \screens/\ contient l'ensemble des écrans de l'application.
- \services/\ contient la logique métier et la gestion d'état avec \Provider\.

## Tests & Couverture (17 fichiers)

Le projet comprend une suite complète de **17 fichiers de tests individuels** :

- **10 tests unitaires** (\	est/unit/\) pour le modèle Task et le service TaskService.
- **5 tests de widgets** (\	est/widgets/\) pour vérifier le comportement de l'interface et des composants.
- **2 tests d'intégration** (\integration_test/\) pour valider le lancement et les parcours utilisateurs principaux.

Exécution des tests unitaires et de widgets :

\\\ash
flutter test
\\\

Exécution des tests d'intégration :

\\\ash
flutter test integration_test/app_launch_test.dart
flutter test integration_test/app_navigation_test.dart
\\\

## Qualité du code

L'analyse statique du projet est effectuée avec :

\\\ash
flutter analyze
\\\

Le projet reste sans erreurs ni avertissements (0 warning / 0 error).

## Internationalisation

TaskFlow prend en charge deux langues (FR + EN) :

- Français
- English

L'utilisateur peut basculer la langue directement depuis l'écran Paramètres.

## Accessibilité

Les éléments interactifs importants de l'application intègrent des labels sémantiques (\Semantics\) afin de faciliter leur utilisation avec les technologies d'assistance et lecteurs d'écran.

## Performance

L'application privilégie :

- L'utilisation systématique de widgets \const\ pour éviter les reconstructions inutiles.
- Une gestion d'état ciblée avec \ChangeNotifierProvider\ et \Consumer\.
- Des listes adaptées pour assurer un défilement fluide.

## Installation

### Prérequis

- Flutter & Dart SDK
- Google Chrome (optionnel pour tests web)

### Installation

\\\ash
git clone https://github.com/angenicolen/production_ready_app.git
cd production_ready_app
flutter pub get
flutter run
\\\

## CI/CD

Le projet utilise **GitHub Actions** (\lutter_ci.yml\) pour automatiser la qualité du code à chaque push :

- \lutter pub get\
- \lutter analyze\
- \lutter test\

## Versions

Les principales évolutions du projet sont documentées dans le fichier \CHANGELOG.md\.
