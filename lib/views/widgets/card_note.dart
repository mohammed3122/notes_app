import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/preview_note/preview_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class CardNote extends StatelessWidget {
  const CardNote({
    super.key,
    required this.backGroundColor,
    required this.note,
  });
  final Color backGroundColor;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: SizedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, EditNotesView.id);
          },
          child: Card(
            color: backGroundColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Spacer(flex: 1),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 60,
                          child: Text(
                            note.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ),
                        // Spacer(flex: 1),
                        SizedBox(height: 20),
                        Text(
                          note.content,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Spacer(flex: 1),
                        IconButton(
                          onPressed: () {
                            note.delete();
                            BlocProvider.of<PreviewNoteCubit>(
                              context,
                            ).previewNote();
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        // Spacer(flex: 2),
                        SizedBox(height: 60),
                        Text(
                          r'novamber 8,2025',
                          style: TextStyle(color: Colors.white),
                        ),
                        // Spacer(flex: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
