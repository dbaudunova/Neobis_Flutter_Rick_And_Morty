import 'package:dio/dio.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  @override
  Future<List<CharacterModel>> getAllCharacters(int page,String name,) async {
    String url = 'https://rickandmortyapi.com/api/character/?name=$name';
    return _getCharacterFromUrl(url);
  }

  Future<List<CharacterModel>> _getCharacterFromUrl(String url) async {
    final response = await Dio().get(url);
    final List<dynamic> results = response.data['results'];
    final List<CharacterModel> characters = results
        .map((json) => CharacterModel.fromJson(json))
        .toList();
    return characters;
  }
}
