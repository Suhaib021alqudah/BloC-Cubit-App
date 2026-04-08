import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorbloc/data/models/characters_model.dart';
import 'package:rickandmorbloc/data/repository/character_repository.dart';

part 'rickandmory_state.dart';

class RickandmoryCubit extends Cubit<RickandmoryState> {
  final CharactersRepository charactersRepository;

  RickandmoryCubit({required this.charactersRepository})
    : super(RickandmoryInitial());

  void getAllCharacters() async {
    try {
      final characters = await charactersRepository.getAllCharacters();
      emit(CharactersLoaded(characters.results!));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }
}
