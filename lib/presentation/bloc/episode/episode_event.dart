part of 'episode_bloc.dart';

abstract class EpisodeEvent {}

class GetEpisodes extends EpisodeEvent {
  final List<String> url;

  GetEpisodes({required this.url});
}
