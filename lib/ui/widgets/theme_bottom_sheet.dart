import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/ui/widgets/theme_list_tile.dart';
import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: .start,
      children: [
        ThemeListTile(theme: ThemeMode.dark,text: AppLocalizations.of(context)!.dark,),
        ThemeListTile(theme: ThemeMode.light,text: AppLocalizations.of(context)!.light,),
      ],
    );
  }
}
