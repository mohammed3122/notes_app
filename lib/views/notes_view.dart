import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add_note.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/notes_list.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(icon: Icon(Icons.search, size: 30), text: 'Notes'),
            Expanded(child: NotesList()),
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            // scrollControlDisabledMaxHeightRatio: 0.5,
            context: context,
            builder: (context) {
              return AddNewNote();
            },
          );
        },
        titleButton: '+',
        height: 55,
        width: 55,
        shadowColor: Colors.black.withValues(alpha: 0.5),
      ),
    );
  }
}
