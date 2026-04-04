import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class LanguageUtils {
  static Future<void> toggleLanguage(BuildContext context) async {
    Locale local = context.locale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    return await context.setLocale(local);
  }
  static bool isEnglish(BuildContext context)=> context.locale.languageCode=='en';
}
