import 'package:dio/dio.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  @override
  Future<List<CharacterModel>> getAllCharacters(String name) async {
    String url = 'https://rickandmortyapi.com/api/character/?name=$name';
    return _getCharactersFromUrl(url, []);
  }

  Future<List<CharacterModel>> _getCharactersFromUrl(
    String url,
    List<CharacterModel> allCharacters,
  ) async {
    final response = await Dio().get(url);
    final List<dynamic> results = response.data['results'];
    final List<CharacterModel> characters =
    results.map((json) => CharacterModel.fromJson(json)).toList();

    allCharacters.addAll(characters);

    final nextPageUrl = response.data['info']['next'];
    if (nextPageUrl != null) {
      return _getCharactersFromUrl(nextPageUrl, allCharacters);
    } else {
      return allCharacters;
    }
  }
}
