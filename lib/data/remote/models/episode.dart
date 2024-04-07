import 'package:json_annotation/json_annotation.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/episode.dart';

part 'episode.g.dart';

@JsonSerializable()
class EpisodeModel extends EpisodeEntity {
  EpisodeModel({
    super.id,
    super.name,
    super.airDate,
    super.episode,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
