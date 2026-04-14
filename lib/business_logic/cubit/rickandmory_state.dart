part of 'rickandmory_cubit.dart';

@immutable
sealed class RickandmoryState {}

final class RickandmoryInitial extends RickandmoryState {}

final class CharactersLoaded extends RickandmoryState {
  final List<Results> characters;
  CharactersLoaded(this.characters);
}

class CharactersError extends RickandmoryState {
  final String message;
  CharactersError(this.message);

  get error => message;
}
