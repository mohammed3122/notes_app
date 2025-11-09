import 'package:flutter/material.dart';

OutlineInputBorder buildBorder([Color color = Colors.white]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color, width: 2),
  );
}
