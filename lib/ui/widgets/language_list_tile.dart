import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../../providers/language_provider.dart';

class LanguageListTile extends StatelessWidget {
  final String language;
  final String text;
  const LanguageListTile({super.key, required this.language, required this.text});

  @override
  Widget build(BuildContext context) {
    var languageProvide = Provider.of<LanguageProvider>(context);
    bool isSelected = languageProvide.languageCode == language;
    return ListTile(

      title: Text(text,style: isSelected? Theme.of(context).textTheme.headlineMedium :Theme.of(context).textTheme.titleLarge,),
      trailing: Visibility(visible: isSelected, child: Icon(Icons.check, color:  Theme.of(context).focusColor,size: 30,)),
      onTap: () => languageProvide.changeLanguage(language),
    );
  }
}
