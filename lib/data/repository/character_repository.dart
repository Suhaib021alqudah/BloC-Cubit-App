import 'package:rickandmorbloc/data/models/characters_model.dart';
import 'package:rickandmorbloc/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<CharactersModel> getAllCharacters() async {
    final charactersData = await charactersWebServices.getAllCharacters();

    return CharactersModel.fromJson(charactersData as Map<String, dynamic>);
  }
}
