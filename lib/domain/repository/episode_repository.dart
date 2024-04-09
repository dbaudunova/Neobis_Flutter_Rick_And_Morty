import 'package:neobis_flutter_rick_and_morty/domain/models/episode.dart';

abstract class EpisodeRepository {
  Future<List<EpisodeEntity>> getEpisodes(String episode);
}