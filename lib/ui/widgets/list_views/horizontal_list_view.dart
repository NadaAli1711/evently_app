import 'package:evently_app/ui/widgets/containers/tapped_container.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_context.dart';
import '../../../core/utils/list_utils.dart';

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({super.key});

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return SizedBox(
      height: height * 0.05,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) => TappedContainer(
          onTap: () {
            selectedIndex = index;
            setState(() {});
          },
          isSelected: index == selectedIndex,
          iconName: ListUtils.itemIconsList[index],
          text: ListUtils.itemList[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: width * 0.02),
        itemCount: ListUtils.itemList.length,
      ),
    );
  }
}
