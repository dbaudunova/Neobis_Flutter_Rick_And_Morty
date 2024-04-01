import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_assets.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/pages/character_info.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/pages/filters.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/character_count_widget.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/grid_character_item.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/list_character_item.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/search_bar_style.dart';

class CharacterCatalog extends StatefulWidget {
  const CharacterCatalog({super.key});

  @override
  State<CharacterCatalog> createState() => _CharacterCatalogState();
}

class _CharacterCatalogState extends State<CharacterCatalog> {
  bool isGridView = false;

  final _characters = [
    Character(
      id: 0,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      origin: Origin(name: 'Земля'),
      location: Location(name: 'Земля (Измерение подменны)'),
      gender: 'Мужской',
      image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    ),
    Character(
      id: 1,
      name: 'Морти Смит',
      status: 'Живой',
      species: 'Человек',
      origin: Origin(name: 'Земля'),
      location: Location(name: 'Земля'),
      gender: 'Мужской',
      image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
    ),
    Character(
      id: 2,
      name: 'Саммер Смит',
      status: 'Живой',
      species: 'Человек',
      origin: Origin(name: 'Земля'),
      location: Location(name: 'Земля (Измерение подменны)'),
      gender: 'Женский',
      image: 'https://rickandmortyapi.com/api/character/avatar/3.jpeg',
    ),
    Character(
      id: 3,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      origin: Origin(name: 'Земля'),
      location: Location(name: 'Земля (Измерение подменны)'),
      gender: 'Мужской',
      image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    ),
    Character(
      id: 4,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      origin: Origin(name: 'Земля'),
      location: Location(name: 'Земля (Измерение подменны)'),
      gender: 'Мужской',
      image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    ),
    Character(
      id: 5,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      origin: Origin(name: 'Земля'),
      location: Location(name: 'Земля (Измерение подменны)'),
      gender: 'Мужской',
      image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    ),
    Character(
      id: 6,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      origin: Origin(name: 'Земля'),
      location: Location(name: 'Земля (Измерение подменны)'),
      gender: 'Мужской',
      image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    ),
    Character(
      id: 7,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      origin: Origin(name: 'Земля'),
      location: Location(name: 'Земля (Измерение подменны)'),
      gender: 'Мужской',
      image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: SearchBarStyle(
                hint: 'Найти персонажа',
                trailing: [
                  IconButton(
                    onPressed: () {
                      _filterNavigate(context);
                    },
                    icon: SvgPicture.asset(AppAssets.filter),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: CharacterCountStyle(
                    text: 'Всего персонажей: ${_characters.length}',
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _onIconTap();
                    },
                    child: SvgPicture.asset(
                      isGridView ? AppAssets.list : AppAssets.grid,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: isGridView ? _buildGridView() : _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: _characters.length,
      itemBuilder: _listViewBuilder,
    );
  }

  Widget? _listViewBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: ListCharacterItem(
        character: _characters.elementAt(index),
        onTap: () {
          _characterInfoNavigate(context, _characters.elementAt(index));
        },
      ),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
      itemCount: _characters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: _gridViewBuilder,
    );
  }

  Widget? _gridViewBuilder(context, index) {
    return GridCharacterItem(
      character: _characters.elementAt(index),
      onTap: () {
        _characterInfoNavigate(context, _characters.elementAt(index));
      },
    );
  }

  void _characterInfoNavigate(context, character) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CharacterInfo(
                character: character,
              ) //Filters(),
          ),
    );
  }

  void _onIconTap() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  void _filterNavigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Filters(),
      ),
    );
  }
}
