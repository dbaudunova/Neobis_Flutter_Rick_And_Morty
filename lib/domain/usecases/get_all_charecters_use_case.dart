import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/character_repository.dart';

class GetAllCharactersUseCase {
  final CharacterRepository repository;

  GetAllCharactersUseCase(this.repository);

  Future<List<CharacterEntity>> call(String name) async {
    return await repository.getAllCharacters(name);
  }
}