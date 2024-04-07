import 'package:json_annotation/json_annotation.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';

part 'character.g.dart';

@JsonSerializable()
class CharacterModel extends CharacterEntity {
  CharacterModel({
    super.id,
    super.name,
    super.status,
    super.species,
    super.gender,
    super.location,
    super.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
