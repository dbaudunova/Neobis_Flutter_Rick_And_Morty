part of 'episode_bloc.dart';

abstract class EpisodeEvent {
}

class GetEpisodes extends EpisodeEvent {
  final String? url;

  GetEpisodes({this.url});
}
