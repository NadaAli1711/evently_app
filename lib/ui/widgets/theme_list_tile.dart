import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';

class ThemeListTile extends StatelessWidget {
  final ThemeMode theme;
  final String text;
  const ThemeListTile({super.key, required this.theme, required this.text});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isSelected = themeProvider.themeMode == theme;
    return ListTile(
      title: Text(text,style: isSelected? AppStyles.mainBlue20SemiBold :AppStyles.mainText20SemiBold,),
      trailing: Visibility(visible: isSelected, child: Icon(Icons.check, color: AppColors.mainBlue,size: 30,)),
      onTap: (){ themeProvider.changeTheme(theme);print("Theme Changed to $theme");}
    );
  }
}
