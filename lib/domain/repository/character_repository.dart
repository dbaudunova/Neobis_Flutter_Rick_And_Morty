import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getAllCharacters();
}