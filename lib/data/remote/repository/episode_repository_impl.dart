import 'package:dio/dio.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/models/episode.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/episode_repository.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {

  @override
  Future<List<EpisodeModel>> getEpisodes(String series) async {
    final response =
    await Dio().get('https://rickandmortyapi.com/api/episode/$series');
    List<EpisodeModel> episodes;
    if (series.contains(',')) {
      final List<dynamic> data = response.data;

      episodes = data.map((e) => EpisodeModel.fromJson(e)).toList();
    } else {
      final Map<String, dynamic> data = response.data;
      final episode = EpisodeModel.fromJson(data);
      episodes = [episode];
    }
    return episodes;
  }
}