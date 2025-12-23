import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/preview_note/preview_notes_cubit.dart';
import 'package:notes_app/widgets/add_note.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/notes_list.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PreviewNoteCubit>(context).previewNote();
  }

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
