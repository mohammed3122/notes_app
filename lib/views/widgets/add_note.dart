import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/cubits/preview_note/preview_notes_cubit.dart';
import 'package:notes_app/views/widgets/form_input.dart';
import 'package:notes_app/views/widgets/messanger_snackBar.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child:
          //  DraggableScrollableSheet(
          //   initialChildSize: 0.6,
          //   maxChildSize: 0.9,
          //   minChildSize: 0.3,
          //   expand: false,
          //   builder: (context, scrollController) {
          //     return
          BlocConsumer<AddNoteCubit, AddNoteCubitState>(
            listener: (context, state) {
              if (state is AddNoteCubitFailed) {
                showSnackBarMessage(
                  context,
                  message: 'Sorry there is an Error',
                  icon: Icons.error_rounded,
                  backgroundColor: Colors.yellow,
                );
              } else if (state is AddNoteCubitSucess) {
                showSnackBarMessage(
                  context,
                  message: 'Done : Note is Added',
                  icon: Icons.done,
                  backgroundColor: Colors.green,
                );
                Navigator.pop(context);
                BlocProvider.of<PreviewNoteCubit>(context).previewNote();
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is AddNoteCubitLoading ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    // controller: scrollController,
                    child: FormAddNote(),
                  ),
                  // ),
                ),
              );
              //   },
              // );
            },
          ),
    );
  }
}
