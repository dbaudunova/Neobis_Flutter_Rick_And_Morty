import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/character_repository.dart';

class SearchCharacter{
  final CharacterRepository repository;

  SearchCharacter(this.repository);

  Future<List<Character>> searchCharacter(String name) async {
    return await repository.searchCharacter(name);
  }
}