import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';

class CharacterEntity extends Character {
  CharacterEntity({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.gender,
    required super.origin,
    required super.location,
    required super.image,
  });
}
