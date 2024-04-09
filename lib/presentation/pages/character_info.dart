import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/enums.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/bloc/episode/episode_bloc.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/column_style.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/episode_item.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/stack_image.dart';

class CharacterInfo extends StatefulWidget {
  const CharacterInfo({super.key, required this.character});

  final CharacterEntity character;

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  @override
  void initState() {
    BlocProvider.of<EpisodeBloc>(context).add(GetEpisodes(url: widget.character.episode as List<String>));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StackImage(character: widget.character),
              const SizedBox(
                height: 100,
              ),
              Text(
                widget.character.name ?? '',
                style: AppStyles.nameStyle.copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                widget.character.status!.toUpperCase(),
                style: AppStyles.statusAlive.copyWith(
                  color: statusColor(
                    statusString(
                      widget.character.status,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 16,
                        ),
                        child: ColumnStyle(
                          character: widget.character,
                          text: 'Пол',
                          value: widget.character.gender ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 118,
                          top: 30,
                        ),
                        child: ColumnStyle(
                          character: widget.character,
                          text: 'Расса',
                          value: widget.character.species ?? '',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 16,
                        ),
                        child: ColumnStyle(
                          character: widget.character,
                          text: 'Место рождения',
                          value: widget.character.location!.name ?? '',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 16,
                        ),
                        child: ColumnStyle(
                          character: widget.character,
                          text: 'Местоположение',
                          value: widget.character.location!.name ?? '',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 36),
                child: Divider(color: AppColors.searchBarBackground),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Эпизоды',
                    style: AppStyles.filterText,
                  ),
                ),
              ),
              _buildListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView() =>
      BlocBuilder<EpisodeBloc, EpisodeState>(builder: (context, state) {
        if (state is EpisodeLoading) {
          return const CircularProgressIndicator(); // or any loading widget
        } else if (state is EpisodeDone) {
          if (state.episodes!.isEmpty) {
            return Center(
              child: Text(
                'No episodes found',
                style: AppStyles.searchBar,
              ),
            );
          } else {
            return _listView(state);
          }
        }
        return Text(
          'Что-то пошло не так',
          style: AppStyles.episodeStyle,
        );
      });

  ListView _listView(EpisodeDone state) {
    return ListView.builder(
      itemCount: state.episodes?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => EpisodeItem(
        episode: state.episodes![index],
      ),
    );
  }
}
