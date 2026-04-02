import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import 'custom_container.dart';

class VerticalListView extends StatefulWidget {
  final List<String> darkImagesList = [
    AppImages.sportDark,
    AppImages.birthdayDark,
    AppImages.meetingDark,
    AppImages.exhibitionDark,
    AppImages.bookClubDark,
  ];
  final List<String> lightImagesList = [
    AppImages.sportLight,
    AppImages.birthdayLight,
    AppImages.meetingLight,
    AppImages.exhibitionLight,
    AppImages.bookClubLight,
  ];

  VerticalListView({super.key});

  @override
  State<VerticalListView> createState() => _VerticalListViewState();
}

class _VerticalListViewState extends State<VerticalListView> {
  int selectedIndex = 0;
  late List<bool> isFavorite;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite = List.generate(widget.darkImagesList.length, (index) => false,);
  }



  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ListView.separated(
      itemBuilder: (context, index) => Container(
        height: height * 0.23,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.02,
        ),
        clipBehavior: .antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(color: Theme.of(context).dividerColor),
          image: DecorationImage(
            image: AssetImage(
              themeProvider.isDark
                  ? widget.darkImagesList[index]
                  : widget.lightImagesList[index],
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .start,
          children: [
            CustomContainer(
              containerHeight: height * 0.05,
              child: Text(
                '21 Jan',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            CustomContainer(
              containerHeight: height * 0.07,
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'This is a Birthday Party ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      isFavorite[index] = !isFavorite[index] ;
                      setState(() {

                      });
                    },
                    icon: Icon(
                      isFavorite[index] ? Icons.favorite:Icons.favorite_border_outlined,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(height: height * 0.02),
      itemCount: widget.darkImagesList.length,
    );
  }
}
