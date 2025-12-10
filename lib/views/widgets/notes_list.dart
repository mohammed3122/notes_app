import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/cubits/preview_note/preview_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/card_note.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviewNoteCubit, PreviewNotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<PreviewNoteCubit>(
          context,
        ).notes!;

        if (state is PreviewNoteNoNotes) {
          return Padding(
            padding: const EdgeInsets.only(top: 270.0),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'No Notes Yet !',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  TextSpan(
                    text: '\nAdd Now 📝',
                    style: TextStyle(color: kMainColor, fontSize: 30),
                  ),
                ],
              ),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return CardNote(
                backGroundColor: Colors.green,
                note: notes[index],
              );
            },
          );
        }
      },
    );
  }
}
