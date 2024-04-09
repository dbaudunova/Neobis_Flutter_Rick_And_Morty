import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/episode.dart';
import 'package:neobis_flutter_rick_and_morty/domain/usecases/get_episodes_use_case.dart';

part 'episode_event.dart';

part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodesUseCase _getEpisodesUseCase;
  EpisodeBloc(this._getEpisodesUseCase) : super(const EpisodeLoading()) {
    on<GetEpisodes>(
          (event, emit) async {
        try {
          if (state is! EpisodeDone) {
            emit(const EpisodeLoading());
          }
          String series = event.url
              .map(
                (e) => e.replaceFirst(
                "https://rickandmortyapi.com/api/episode/", ''),
          )
              .join(',');

          List<EpisodeEntity> episodes = await _getEpisodesUseCase.call(series);

          emit(EpisodeDone(episodes));
        } on DioException catch (e) {
          EpisodeError(e);
        }
      },
    );
  }
}
