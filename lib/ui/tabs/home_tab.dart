import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/core/utils/language_utils.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/app_context.dart';
import '../../core/utils/firebase_utils/firebase_utils.dart';
import '../../core/utils/list_utils.dart';
import '../../providers/user_provider.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/event_stream_builder.dart';
import '../widgets/list_views/horizontal_list_view.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = "All";
  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Column(
      spacing: height * 0.025,
      children: [
        Row(
          spacing: width * 0.02,
          children: [
            Column(
              spacing: height * 0.02,
              children: [
                Text(
                  'welcome_back'.tr(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  Provider.of<UserProvider>(context).currentUser!.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              icon: ImageIcon(
                AssetImage(
                  themeProvider.isDark ? AppImages.moon : AppImages.sun,
                ),
                color: Theme.of(context).cardColor,
              ),
            ),
            CustomElevatedButton(
              onPressed: () => LanguageUtils.toggleLanguage(context),
              borderRadius: 8,
              verticalPadding: height * 0.01,
              horizontalPadding: width * 0.03,
              minimumSize: Size.zero,
              child: Text(
                context.locale.languageCode.toUpperCase(),
                style: AppStyles.white14SemiBold,
              ),
            ),
          ],
        ),
        HorizontalListView(
          iconsList: ListUtils.getHomeIcons(),
          categoryList:ListUtils.getHomeCategoryList() ,
          onCategoryChanged: (selectedIndex) {
            setState(() {
              selectedCategory = ListUtils.getHomeCategoryList()[selectedIndex];
            });
          },
        ),
        EventStreamBuilder(stream: FirebaseUtils.getEvents(uId:userProvider.currentUser!.uId,categoryName: selectedCategory),)
      ],
    );
  }
}
