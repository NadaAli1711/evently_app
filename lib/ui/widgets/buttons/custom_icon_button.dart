import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? iconColor;

  const CustomIconButton({super.key, this.onPressed, this.icon = Icons.arrow_back_ios,this.iconColor});

  @override
  State<CustomIconButton> createState() => _ArrowBackButtonState();
}

class _ArrowBackButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(left: 10),

      icon: Icon(widget.icon, color: widget.iconColor??Theme.of(context).focusColor),
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      onPressed: widget.onPressed ?? () => goBack(),
    );
  }

  void goBack() {
    Navigator.of(context).pop();
  }
}
