import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'language_list_tile.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: .start,
      children: [
        LanguageListTile(language: 'en',text: 'english'.tr(),),
        LanguageListTile(language: 'ar',text: 'arabic'.tr(),),
      ],
    );
  }
}
