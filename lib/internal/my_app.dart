import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/repository/character_repository_impl.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/repository/episode_repository_impl.dart';
import 'package:neobis_flutter_rick_and_morty/domain/usecases/get_all_characters_use_case.dart';
import 'package:neobis_flutter_rick_and_morty/domain/usecases/get_episodes_use_case.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/bloc/character_bloc.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/bloc/episode/episode_bloc.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/pages/character_catalog.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharacterBloc(GetAllCharactersUseCase(CharacterRepositoryImpl())),
        ), BlocProvider(
          create: (context) =>
              EpisodeBloc(GetEpisodesUseCase(EpisodeRepositoryImpl())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: AppColors.appColor,
        ),
        home: const CharacterCatalog(),
      ),
    );
  }
}
