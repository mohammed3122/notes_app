import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/cubits/preview_note/preview_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/customTextField.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

class FormAddNote extends StatefulWidget {
  const FormAddNote({super.key});

  @override
  State<FormAddNote> createState() => _FormAddNoteState();
}

class _FormAddNoteState extends State<FormAddNote> {
  String? noteTitle;
  String? noteContent;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'ex : My Day',
            labelText: 'Title',
            prefixIcon: Icon(Icons.title),
            isPassword: false,
            keyboardType: TextInputType.text,
            onSaved: (title) {
              noteTitle = title;
            },
          ),
          CustomTextFormField(
            hintText: 'ex : This is a nice day',
            labelText: 'Content',
            maxLines: 8,
            prefixIcon: Icon(Icons.description_outlined),
            isPassword: false,
            keyboardType: TextInputType.text,
            onSaved: (content) {
              noteContent = content;
            },
          ),
          SizedBox(height: 15),
          BlocBuilder<AddNoteCubit, AddNoteCubitState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteCubitLoading ? true : false,
                titleButton: 'Add',
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    NoteModel noteModel = NoteModel(
                      title: noteTitle!,
                      content: noteContent!,
                      date: DateTime.now().toString(),
                      color: Colors.green.toARGB32(),
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                height: 60,
                width: 300,
                shadowColor: Colors.white.withValues(alpha: 0.3),
              );
            },
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
