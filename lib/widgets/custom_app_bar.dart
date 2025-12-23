import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/widgets/app_bar_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });
  final Widget icon;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 30, color: kMainColor)),
        Spacer(),
        AppBarButton(icon: icon, onPressed: onPressed),
      ],
    );
  }
}
