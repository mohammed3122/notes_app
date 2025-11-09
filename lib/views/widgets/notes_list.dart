import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/card_note.dart';

class NotesList extends StatelessWidget {
  NotesList({super.key});
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blueAccent,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemCount: 7,
      itemBuilder: (context, index) {
        return CardNote(backGroundColor: colors[index]);
      },
    );
  }
}
