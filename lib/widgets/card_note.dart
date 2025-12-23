import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/preview_note/preview_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class CardNote extends StatelessWidget {
  const CardNote({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: SizedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, EditNotesView.id, arguments: note);
          },
          child: Card(
            color: Color(note.color),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Spacer(flex: 1),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 205,
                          child: Text(
                            note.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ),
                        // Spacer(flex: 1),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 205,
                          child: Text(
                            note.content,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  // Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          note.delete();
                          BlocProvider.of<PreviewNoteCubit>(
                            context,
                          ).previewNote();
                        },
                        icon: Icon(Icons.delete, color: Colors.black, size: 30),
                      ),
                      // Spacer(),
                      SizedBox(height: 60),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.end,
                            note.date,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      // Spacer(flex: 1),
                    ],
                  ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
