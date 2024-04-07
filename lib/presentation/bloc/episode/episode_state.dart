part of 'episode_bloc.dart';

abstract class EpisodeState {
  final List<EpisodeEntity>? episodes;
  final DioException? error;

  const EpisodeState({this.episodes, this.error});
}

class EpisodeLoading extends EpisodeState {
  const EpisodeLoading();
}

class EpisodeDone extends EpisodeState {
  const EpisodeDone(List<EpisodeEntity> episodes)
      : super(episodes: episodes);
}

class EpisodeError extends EpisodeState {
  const EpisodeError(DioException error) : super(error: error);
}
