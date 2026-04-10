import 'package:evently_app/ui/widgets/containers/tapped_container.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_context.dart';

class HorizontalListView extends StatefulWidget {
  final Function(int)? onCategoryChanged;
  final List<String> categoryList;
  final List<String> iconsList;
  final int? initialIndex;

  const HorizontalListView({
    super.key,
    this.onCategoryChanged,
    required this.categoryList,
    required this.iconsList,
    this.initialIndex,
  });

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex ?? 0;
  }

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
            widget.onCategoryChanged?.call(selectedIndex);
          },
          isSelected: index == selectedIndex,
          iconName: widget.iconsList[index],
          text: widget.categoryList[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: width * 0.02),
        itemCount: widget.categoryList.length,
      ),
    );
  }
}