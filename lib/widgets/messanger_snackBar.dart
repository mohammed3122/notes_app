import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

void showSnackBarMessage(
  BuildContext context, {
  required String message,
  required IconData icon,
  required Color backgroundColor,
}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(icon, color: kMainColor),
        const SizedBox(width: 12),
        Expanded(child: Text(message, style: const TextStyle(fontSize: 16))),
      ],
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
