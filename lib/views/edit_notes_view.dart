import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/preview_note/preview_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_for_edit.dart';
import 'package:notes_app/widgets/customTextField.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/messanger_snackBar.dart';

class EditNotesView extends StatefulWidget {
  const EditNotesView({super.key});
  static final String id = 'EditNotes';

  @override
  State<EditNotesView> createState() => _EditNotesViewState();
}

class _EditNotesViewState extends State<EditNotesView> {
  String? editTitle;

  String? editContent;

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 20),
            CustomAppBar(
              icon: Icon(Icons.done, size: 30),
              text: 'Edit Notes',
              onPressed: () {
                note.title = editTitle ?? note.title;
                note.content = editContent ?? note.content;
                note.save();
                Navigator.pop(context);
                if (note.title == editTitle || note.content == editContent) {
                  showSnackBarMessage(
                    context,
                    message: 'Edit : Note is Edit',
                    icon: Icons.edit,

                    backgroundColor: Colors.yellow.shade500,
                  );
                }

                BlocProvider.of<PreviewNoteCubit>(context).previewNote();
              },
            ),

            SizedBox(height: 30),
            CustomTextFormField(
              hasWidth: true,
              hintText: 'Title : ${note.title}',
              prefixIcon: Icon(Icons.title),
              isPassword: false,
              keyboardType: TextInputType.text,
              onChanged: (title) {
                editTitle = title;
              },
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              hasWidth: true,
              hintText: 'Content : ${note.content}',
              maxLines: 8,
              prefixIcon: Icon(Icons.description_outlined),
              isPassword: false,
              keyboardType: TextInputType.multiline,
              onChanged: (content) {
                editContent = content;
              },
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 32 * 2,
              child: ListOfColorsForEdit(note: note),
            ),
          ],
        ),
      ),
    );
  }
}
