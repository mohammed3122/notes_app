import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.titleButton,
    required this.onTap,
    required this.height,
    required this.width,
    required this.shadowColor,
  });
  final String titleButton;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color shadowColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 5, color: shadowColor, offset: Offset(2, 2)),
          ],
          borderRadius: BorderRadius.circular(30),
          color: kMainColor,
        ),
        child: Center(
          child: Text(
            titleButton,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
