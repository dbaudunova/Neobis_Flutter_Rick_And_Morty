import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/episode.dart';
import 'package:neobis_flutter_rick_and_morty/domain/usecases/get_episodes_use_case.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodesUseCase _getEpisodesUseCase;

  EpisodeBloc(this._getEpisodesUseCase) : super(const EpisodeLoading()) {
    on<GetEpisodes>(onGetEpisodes);
  }

  void onGetEpisodes(GetEpisodes event, Emitter<EpisodeState> emit) async {
    emit(const EpisodeLoading());
    try {
      final String path = event.url?.extractPath() ?? '';
      final dataState = await _getEpisodesUseCase.call(path);
      emit(EpisodeDone(dataState));
    } on DioException catch (e) {
      emit(EpisodeError(e));
    }
  }
}

extension UrlExtension on String {
  String extractPath() {
    List<String> parts = split('/');
    String path = '/${parts.skip(4).join('/')}';
    return path;
  }
}