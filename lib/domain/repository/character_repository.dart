import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/episode.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getAllCharacters(String name);
  Future<List<EpisodeEntity>> getEpisodes(String episode);
}