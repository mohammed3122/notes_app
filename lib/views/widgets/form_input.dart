import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customTextField.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

class FormAddNote extends StatefulWidget {
  const FormAddNote({super.key});

  @override
  State<FormAddNote> createState() => _FormAddNoteState();
}

class _FormAddNoteState extends State<FormAddNote> {
  String? noteTitle, noteContent;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'ex : My Day',
            labelText: 'Title',
            prefixIcon: Icon(Icons.title),
            isPassword: false,
            keyboardType: TextInputType.text,
            onSaved: (title) {
              noteTitle = title;
            },
          ),
          CustomTextField(
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
          CustomButton(
            titleButton: 'Add',
            onTap: () {
              if (formkey.currentState!.validate()) {
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            height: 60,
            width: 300,
            shadowColor: Colors.white.withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}
