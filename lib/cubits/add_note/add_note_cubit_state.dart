part of 'add_note_cubit_cubit.dart';

@immutable
abstract class AddNoteCubitState {}

class AddNoteCubitInitial extends AddNoteCubitState {}

class AddNoteCubitLoading extends AddNoteCubitState {}

class AddNoteCubitSucess extends AddNoteCubitState {}

class AddNoteCubitFailed extends AddNoteCubitState {
  final String messageError;

  AddNoteCubitFailed({required this.messageError});
}
