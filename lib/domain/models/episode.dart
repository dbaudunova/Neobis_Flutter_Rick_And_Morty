import 'package:json_annotation/json_annotation.dart';

class EpisodeEntity {
  final int? id;
  final String? name;
  @JsonKey(name: 'air_date')
  final String? airDate;
  final String? episode;

  EpisodeEntity({
    this.id,
    this.name,
    this.airDate,
    this.episode,
  });
}
