import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';

class NoteColor extends StatelessWidget {
  const NoteColor({
    super.key,
    required this.backGroundColor,
    required this.isCurrentColor,
  });
  final Color backGroundColor;
  final bool isCurrentColor;
  @override
  Widget build(BuildContext context) {
    return isCurrentColor
        ? Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: backGroundColor,
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 22,
                child: Icon(size: 40, color: kMainColor, Icons.check_circle),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: CircleAvatar(radius: 30, backgroundColor: backGroundColor),
            ),
          );
  }
}
