import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit_cubit.dart';
import 'package:notes_app/functions/formatted_data.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list.dart';
import 'package:notes_app/widgets/customTextField.dart';
import 'package:notes_app/widgets/custom_button.dart';

class FormAddNoteView extends StatefulWidget {
  const FormAddNoteView({super.key});

  @override
  State<FormAddNoteView> createState() => _FormAddNoteViewState();
}

class _FormAddNoteViewState extends State<FormAddNoteView> {
  String? noteTitle;
  String? noteContent;
  int? color;
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
            keyboardType: TextInputType.multiline,
            onSaved: (content) {
              noteContent = content;
            },
          ),
          SizedBox(height: 10),
          SizedBox(height: 32 * 2, width: 350, child: ListOfColors()),
          SizedBox(height: 20),
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
                      date: formattedDate(),
                      color: BlocProvider.of<AddNoteCubit>(
                        context,
                      ).color.toARGB32(),
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
