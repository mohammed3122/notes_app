import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key, required this.icon, required this.onPressed});
  final Widget icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withValues(alpha: .1),
      ),
      child: IconButton(icon: icon, onPressed: onPressed, color: kMainColor),
    );
  }
}
