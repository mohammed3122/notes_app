import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());

  addNote(NoteModel note) {}
}
