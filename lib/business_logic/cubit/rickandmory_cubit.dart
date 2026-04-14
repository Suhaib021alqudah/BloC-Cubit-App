import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorbloc/data/models/characters_model.dart';
import 'package:rickandmorbloc/data/repository/character_repository.dart';

part 'rickandmory_state.dart';

class RickandmoryCubit extends Cubit<RickandmoryState> {
  final CharactersRepository charactersRepository;

  RickandmoryCubit({required this.charactersRepository})
    : super(RickandmoryInitial());

  List<Results> allCharacters = [];
  List<Results> searchedCharacters = [];

  void getAllCharacters() async {
    try {
      final characters = await charactersRepository.getAllCharacters();
      allCharacters = characters.results!;
      emit(CharactersLoaded(allCharacters));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }

  void searchCharacters(String name) {
    if (name.isEmpty) {
      emit(CharactersLoaded(allCharacters));
      return;
    }
    searchedCharacters = allCharacters
        .where(
          (char) => char.name!.toLowerCase().startsWith(name.toLowerCase()),
        )
        .toList();

    emit(CharactersLoaded(searchedCharacters));
  }
}
