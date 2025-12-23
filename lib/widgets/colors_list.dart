import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit_cubit.dart';
import 'package:notes_app/widgets/note_color.dart';

class ListOfColors extends StatefulWidget {
  const ListOfColors({super.key});

  @override
  State<ListOfColors> createState() => _ListOfColorsState();
}

class _ListOfColorsState extends State<ListOfColors> {
  int currentIndexColor = 1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: kColors.length,
      itemBuilder: (context, currentIndexItem) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndexColor = currentIndexItem;
            });
            BlocProvider.of<AddNoteCubit>(context).color =
                kColors[currentIndexItem];
          },
          child: NoteColor(
            backGroundColor: kColors[currentIndexItem],
            isCurrentColor: currentIndexColor == currentIndexItem,
          ),
        );
      },
    );
  }
}
