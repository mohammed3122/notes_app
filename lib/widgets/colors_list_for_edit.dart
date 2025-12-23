import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_color.dart';

class ListOfColorsForEdit extends StatefulWidget {
  const ListOfColorsForEdit({super.key, required this.note});
  final NoteModel note;
  @override
  State<ListOfColorsForEdit> createState() => _ListOfColorsForEditState();
}

class _ListOfColorsForEditState extends State<ListOfColorsForEdit> {
  late int currentIndexColor;

  @override
  void initState() {
    currentIndexColor = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: kColors.length,
      itemBuilder: (context, currentIndexItem) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndexColor = currentIndexItem;
            });
            widget.note.color = kColors[currentIndexItem].toARGB32();
          },
          child: NoteColor(
            backGroundColor: kColors[currentIndexItem],
            isCurrentColor: currentIndexColor == currentIndexItem,
          ),
        );
      },
    );
  }
}
