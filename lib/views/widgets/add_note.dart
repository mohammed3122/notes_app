import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customTextField.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: FormInput(),
        );
      },
    );
  }
}

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? noteTitle, noteContent;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
              if (formKey.currentState!.validate()) {
                log('hi');
                formKey.currentState!.save();
                // احفظ الداتا لسه
                // شوف onSaved in TextFormField
                // done
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
