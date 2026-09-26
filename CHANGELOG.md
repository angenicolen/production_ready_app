# Changelog

Toutes les modifications importantes du projet TaskFlow sont documentées dans ce fichier.

## [1.0.0] - 2026-09-25

### Ajouté
- Application complète de gestion de tâches
- Navigation entre 5 écrans (Accueil, Tâches, Ajout, Statistiques, Détails de la tâche)
- Migration de la gestion d'état vers Provider (découplage du TaskService)
- Création, suppression et modification de l'état des tâches
- Statistiques complètes sur les tâches
- Support du français et de l'anglais (i10n)
- Validation des formulaires et gestion d'erreurs
- Support de l'accessibilité avec des labels sémantiques (`Semantics`)
- Suite de tests complète (10 tests unitaires, 5 tests de widgets, 2 tests d'intégration)
- Configuration de la CI/CD avec GitHub Actions et analyse statique (`flutter analyze clean`)

## [0.2.0] - 2026-09-20

### Ajouté
- Mise en place des premiers tests unitaires et de widgets
- Ajout des tests d'intégration de base
- Internationalisation français/anglais
- Écran des paramètres
- Écran des statistiques

## [0.1.0] - 2026-09-15

### Ajouté
- Création de l'application TaskFlow
- Modèle `Task`
- Service `TaskService` en mémoire
- Écran d'accueil
- Écran de gestion des tâches
- Écran d'ajout d'une tâche
- Navigation principale de l'application