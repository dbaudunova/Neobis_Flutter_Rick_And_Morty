import 'package:neobis_flutter_rick_and_morty/domain/models/episode.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/episode_repository.dart';

class GetEpisodesUseCase {
  final EpisodeRepository repository;

  GetEpisodesUseCase(this.repository);

  Future<List<EpisodeEntity>> call(String episodes) async {
    return await repository.getEpisodes(episodes);
  }
}