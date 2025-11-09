import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customTextField.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 10),
          CustomTextField(
            hintText: 'ex : My Day',
            labelText: 'Title',
            prefixIcon: Icon(Icons.title),
            isPassword: false,
            keyboardType: TextInputType.text,
            onChanged: (title) {},
          ),
          CustomTextField(
            hintText: 'ex : This is a nice day',
            labelText: 'Content',
            maxLines: 8,
            prefixIcon: Icon(Icons.description_outlined),
            isPassword: false,
            keyboardType: TextInputType.text,
            onChanged: (title) {},
          ),
          CustomButton(
            titleButton: 'Add',
            onTap: () {},
            height: 60,
            width: 300,
            shadowColor: Colors.white.withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}
