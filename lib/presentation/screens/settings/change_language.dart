import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_app/l10n/app_localizations.dart';
import 'package:soccer_app/presentation/providers/locale_provider.dart';


class ChangeLanguage extends StatelessWidget {
  static const path = '/change-language';
  static const name = 'change-language';
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);

    final english = provider.locale.languageCode == 'en';
    final spanish = provider.locale.languageCode == 'es';

    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.title_change_language),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            value: spanish,
            onChanged: (value) {
                provider.setLocale(const Locale('es'));
            },
            title: const Text('Español'),
          ),
          CheckboxListTile(
            value: english,
            onChanged: (value) {
              provider.setLocale(const Locale('en'));
            },
            title: const Text('Ingles'),
          )
        ],
      ),
    );
  }
}
