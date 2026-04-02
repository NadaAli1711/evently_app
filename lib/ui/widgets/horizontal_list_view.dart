import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
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
    double height = context.height;
    double width = context.width;
    return ListView.separated(
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index) => InkWell(
        onTap: () {
          selectedIndex = index;
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.04),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: BoxBorder.all(
              color: index == selectedIndex
                  ? AppColors.transparent
                  : Theme.of(context).dividerColor,
            ),
            color: index == selectedIndex
                ? Theme.of(context).cardColor
                : Theme.of(context).primaryColor,
          ),
          child: Row(
            spacing: width*0.02,
            children: [
              Image.asset(widget.itemIconsList[index]),
              Text(
                itemList[index],
                style: index == selectedIndex
                    ? AppStyles.white16Medium
                    : Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(width: width*0.02),
      itemCount: itemList.length,
    );
  }
}
