import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/ui/widgets/tapped_container.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_context.dart';
import '../../l10n/app_localizations.dart';

class HorizontalListView extends StatefulWidget {

  final List<String> itemIconsList = [
    AppImages.squars,
    AppImages.bike,
    AppImages.birthdayCake,
    AppImages.book,
    AppImages.book,
    AppImages.book,
  ];
  HorizontalListView({super.key});

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    final List<String> itemList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.book_club,
    ];
    double width = context.width;
    return ListView.separated(
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index) =>
      TappedContainer(
          onTap: () {
        selectedIndex = index;
        setState(() {});
      },
          isSelected: index == selectedIndex,iconName:widget.itemIconsList[index],text: itemList[index],

      ) ,
      separatorBuilder: (context, index) => SizedBox(width: width*0.02),
      itemCount: itemList.length,
    );
  }
}
