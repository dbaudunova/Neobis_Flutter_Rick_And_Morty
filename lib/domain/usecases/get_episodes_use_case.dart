import 'package:neobis_flutter_rick_and_morty/domain/models/episode.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/character_repository.dart';

class GetEpisodesUseCase {
  final CharacterRepository repository;

  GetEpisodesUseCase(this.repository);

  Future<List<EpisodeEntity>> call(String episode) async {
    return await repository.getEpisodes(episode);
  }
}