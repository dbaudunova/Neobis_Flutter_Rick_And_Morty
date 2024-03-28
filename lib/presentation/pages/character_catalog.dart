import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_assets.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/pages/filters.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/character_count_widget.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/grid_character_item.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/list_character_item.dart';

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
      gender: 'мужской',
      image: '',
    ),
    Character(
      id: 1,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      gender: 'мужской',
      image: '',
    ),
    Character(
      id: 2,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      gender: 'мужской',
      image: '',
    ),
    Character(
      id: 3,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      gender: 'мужской',
      image: '',
    ),
    Character(
      id: 4,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      gender: 'мужской',
      image: '',
    ),
    Character(
      id: 5,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      gender: 'мужской',
      image: '',
    ),
    Character(
      id: 6,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      gender: 'мужской',
      image: '',
    ),
    Character(
      id: 7,
      name: 'Рик Санчез',
      status: 'Живой',
      species: 'Человек',
      gender: 'мужской',
      image: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: SearchBar(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.searchBarBackground,
                ),
                hintText: 'Найти персонажа',
                hintStyle: MaterialStateTextStyle.resolveWith(
                  (states) => Styles.searchBar,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
                  child: SvgPicture.asset(AppAssets.search),
                ),
                trailing: [
                  IconButton(
                    onPressed: () {
                      _navigate(context);
                    },
                    icon: SvgPicture.asset(AppAssets.filter),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: CharacterCountStyle(
                    text: 'Всего персонажей: 200',
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
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: ListCharacterItem(
              character: _characters.elementAt(index),
            ),
          );
        });
  }

  GridView _buildGridView() {
    return GridView.builder(
      itemCount: _characters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return GridCharacterItem(
          character: _characters.elementAt(index),
        );
      },
    );
  }

  void _onIconTap() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  void _navigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Filters(),
      ),
    );
  }
}
