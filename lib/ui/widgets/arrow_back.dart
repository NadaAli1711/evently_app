import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  final VoidCallback onPressed;
  const ArrowBack({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(padding: EdgeInsets.only(left: 10),

      icon: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).focusColor,
      ),
      style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Theme.of(context).dividerColor)
          )
      ),
      onPressed: onPressed,
    );
  }
}
