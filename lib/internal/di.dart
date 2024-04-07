import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/repository/character_repository_impl.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/character_repository.dart';
import 'package:neobis_flutter_rick_and_morty/domain/usecases/get_all_characters_use_case.dart';
import 'package:neobis_flutter_rick_and_morty/domain/usecases/get_episodes_use_case.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/bloc/character_bloc.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/bloc/episode/episode_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<CharacterRepository>(CharacterRepositoryImpl());
  sl.registerSingleton<GetAllCharactersUseCase>(GetAllCharactersUseCase(sl()));
  sl.registerSingleton<GetEpisodesUseCase>(GetEpisodesUseCase(sl()));
  sl.registerFactory<CharacterBloc>(() => CharacterBloc(sl()));
  sl.registerFactory<EpisodeBloc>(() => EpisodeBloc(sl()));
}
