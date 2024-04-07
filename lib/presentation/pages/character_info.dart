import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/enums.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/episode.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/column_style.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/episode_item.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/stack_image.dart';

class CharacterInfo extends StatelessWidget {
  CharacterInfo({super.key, required this.character});

  final CharacterEntity character;

  final _episodes = [
    Episode(
      id: 0,
      name: 'Пилот',
      airDate: '9 декабря 2013',
      episode: 'Серия 1',
    ),
    Episode(
      id: 1,
      name: 'Пилот',
      airDate: '9 декабря 2013',
      episode: 'Серия 1',
    ),
    Episode(
      id: 2,
      name: 'Пилот',
      airDate: '9 декабря 2013',
      episode: 'Серия 1',
    ),
    Episode(
      id: 3,
      name: 'Пилот',
      airDate: '9 декабря 2013',
      episode: 'Серия 1',
    ),
    Episode(
      id: 4,
      name: 'Пилот',
      airDate: '9 декабря 2013',
      episode: 'Серия 1',
    ),
    Episode(
      id: 5,
      name: 'Пилот',
      airDate: '9 декабря 2013',
      episode: 'Серия 1',
    ),
    Episode(
      id: 6,
      name: 'Пилот',
      airDate: '9 декабря 2013',
      episode: 'Серия 1',
    ),
    Episode(
      id: 7,
      name: 'Пилот',
      airDate: '9 декабря 2013',
      episode: 'Серия 1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StackImage(character: character),
              const SizedBox(
                height: 100,
              ),
              Text(
                character.name ?? '',
                style: AppStyles.nameStyle.copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                character.status!.toUpperCase(),
                style: AppStyles.statusAlive.copyWith(
                  color: statusColor(
                    statusString(
                      character.status,
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
                          character: character,
                          text: 'Пол',
                          value: character.gender ?? '',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 118,
                          top: 30,
                        ),
                        child: ColumnStyle(
                          character: character,
                          text: 'Расса',
                          value: character.species ?? '',
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
                          character: character,
                          text: 'Место рождения',
                          value: character.location!.name ?? '',
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
                          character: character,
                          text: 'Местоположение',
                          value: character.location!.name ?? '',
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
              _buildListView()
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildListView() => ListView.builder(
      itemCount: _episodes.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: _listViewBuilder);

  Widget? _listViewBuilder(context, index) => EpisodeItem(
        episode: _episodes.elementAt(index),
      );
}
