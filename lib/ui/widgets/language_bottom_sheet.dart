import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'language_list_tile.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: .start,
      children: [
        LanguageListTile(language: 'en',text: AppLocalizations.of(context)!.english,),
        LanguageListTile(language: 'ar',text: AppLocalizations.of(context)!.arabic,),
      ],
    );
  }
}
