// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/models/note_model.dart';
part 'preview_notes_state.dart';

class PreviewNoteCubit extends Cubit<PreviewNotesState> {
  PreviewNoteCubit() : super(PreviewNoteInitial());
  List<NoteModel>? notes;

  previewNote() {
    var dataBox = Hive.box<NoteModel>(kNotesBox);
    notes = dataBox.values.toList();

    if (notes!.isEmpty) {
      emit(PreviewNoteNoNotes());
    } else {
      emit(PreviewNoteSuccess());
    }
  }
}
