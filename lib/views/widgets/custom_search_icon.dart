import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/preview_note/preview_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon});
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withValues(alpha: .1),
      ),
      child: IconButton(
        icon: icon,
        onPressed: () {
          // List<NoteModel> notes =
          //     BlocProvider.of<PreviewNoteCubit>(context).previewNote() ?? [];
          // log(notes.length.toString());
        },
      ),
    );
  }
}
