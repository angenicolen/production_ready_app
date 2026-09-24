import 'package:flutter/material.dart';

import '../localization/app_texts.dart';

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