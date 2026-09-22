# TaskFlow

TaskFlow est une application Flutter de gestion de tâches conçue avec une approche orientée vers la qualité, les tests et la préparation à la production.

## Fonctionnalités

- Affichage d'un tableau de bord d'accueil
- Création de tâches
- Affichage de la liste des tâches
- Marquage d'une tâche comme terminée ou non terminée
- Suppression de tâches
- Statistiques sur les tâches terminées et en attente
- Changement de langue entre français et anglais
- Navigation entre cinq écrans
- Validation des formulaires
- Support de l'accessibilité avec des labels sémantiques
- Interface optimisée avec des widgets `const` lorsque cela est possible

## Écrans

L'application contient cinq écrans principaux :

1. Accueil
2. Mes tâches
3. Ajouter une tâche
4. Statistiques
5. Paramètres

## Architecture

Le projet utilise une structure simple et organisée :

lib/
├── main.dart
├── models/
│   └── task.dart
└── services/
    └── task_service.dart

- `models/` contient les modèles de données.
- `services/` contient la logique de gestion des tâches.
- `main.dart` contient l'application, la navigation et les écrans.

## Tests

Le projet comprend plusieurs niveaux de tests :

- Tests unitaires pour le modèle `Task`
- Tests unitaires pour `TaskService`
- Tests de widgets pour les différents écrans
- Tests d'intégration pour vérifier les parcours utilisateur

Les tests sont exécutés avec :

flutter test

Les tests d'intégration sur Chrome sont exécutés avec :

flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d chrome

## Qualité du code

L'analyse statique du projet est effectuée avec :

flutter analyze

Le projet doit rester sans erreurs ni avertissements avant chaque livraison.

## Internationalisation

TaskFlow prend en charge deux langues :

- Français
- English

L'utilisateur peut changer la langue depuis l'écran Paramètres.

## Accessibilité

Les éléments interactifs importants de l'application utilisent des informations sémantiques afin de faciliter leur utilisation avec les technologies d'assistance.

## Performance

L'application privilégie :

- Les widgets `const` lorsque cela est possible
- Une structure simple limitant les reconstructions inutiles
- Une interface légère et adaptée aux performances de Flutter

## Installation

### Prérequis

- Flutter
- Dart
- Un navigateur compatible, tel que Google Chrome

### Installation du projet

Cloner le dépôt :

git clone <URL_DU_DEPOT>

Entrer dans le projet :

cd production_ready_app

Installer les dépendances :

flutter pub get

Lancer l'application :

flutter run

Pour lancer l'application sur Chrome :

flutter run -d chrome

## Vérification

Avant de publier une nouvelle version, exécuter :

flutter analyze
flutter test

Puis vérifier les tests d'intégration.

## CI/CD

Le projet utilise GitHub Actions pour automatiser les vérifications du code et l'exécution des tests à chaque modification du dépôt.

## Captures d'écran

### Accueil

![Accueil](screenshots/home.png)

### Mes tâches

![Mes tâches](screenshots/tasks.png)

### Ajouter une tâche

![Ajouter une tâche](screenshots/add-task.png)

### Statistiques

![Statistiques](screenshots/statistics.png)

### Paramètres

![Paramètres](screenshots/settings.png)

## Technologies utilisées

- Flutter
- Dart
- Flutter Test
- Integration Test
- GitHub Actions

## Versions

Les principales évolutions du projet sont documentées dans le fichier `CHANGELOG.md`.

## Licence

Ce projet a été réalisé dans le cadre d'un projet Flutter de formation.