import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/customTextField.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key});
  static final String id = 'EditNotes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(icon: Icon(Icons.done, size: 30), text: 'Edit Notes'),
            SizedBox(height: 30),
            CustomTextField(
              hasWidth: true,
              hintText: 'ex : My Day',
              labelText: 'Title',
              prefixIcon: Icon(Icons.title),
              isPassword: false,
              keyboardType: TextInputType.text,
              onChanged: (title) {},
            ),
            SizedBox(height: 20),
            CustomTextField(
              hasWidth: true,
              hintText: 'ex : This is a nice day',
              labelText: 'Content',
              maxLines: 8,
              prefixIcon: Icon(Icons.description_outlined),
              isPassword: false,
              keyboardType: TextInputType.text,
              onChanged: (title) {},
            ),
          ],
        ),
      ),
    );
  }
}
