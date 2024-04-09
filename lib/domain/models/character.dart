import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

class CharacterEntity {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? gender;
  final Location? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  CharacterEntity({
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });
}

@JsonSerializable()
class Location {
  final String? name;
  final String? url;

  Location({
    this.name,
    this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

}
