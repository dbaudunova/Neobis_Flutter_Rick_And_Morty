import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_assets.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/bloc/character_bloc.dart';
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
  bool _isGridView = false;

  @override
  void initState() {
    BlocProvider.of<CharacterBloc>(context).add(GetCharacters());
    super.initState();
  }

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
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AppAssets.line),
                  ),
                  IconButton(
                    onPressed: () {
                      _filterNavigate(context);
                    },
                    icon: SvgPicture.asset(AppAssets.filter),
                  ),
                ],
                onChanged: (String? value) {
                  BlocProvider.of<CharacterBloc>(context).add(
                    GetCharacters(name: value),
                  );
                },
              ),
            ),
            _buildBlocBuilder(),
          ],
        ),
      ),
    );
  }

  BlocBuilder<CharacterBloc, CharacterState> _buildBlocBuilder() {
    return BlocBuilder<CharacterBloc, CharacterState>(builder: _buildBuilder);
  }

  Widget _buildBuilder(context, state) {
    if (state is CharacterLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (state is CharacterError) {
      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.notExist),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 28),
              child: Text(
                'Персонаж с таким именем не найден',
                textAlign: TextAlign.center,
                style: AppStyles.searchBar,
              ),
            )
          ],
        ),
      );
    }
    if (state is CharacterDone) {
      return Expanded(
          child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: CharacterCountStyle(
                  text: 'Всего персонажей: ${state.characters?.length}',
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
                    _isGridView ? AppAssets.list : AppAssets.grid,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: _isGridView ? _buildGridView(state) : _buildListView(state),
          ),
        ],
      ));
    }
    return Center(
      child: Text(
        'Что-то пошло не так',
        style: AppStyles.searchBar,
      ),
    );
  }

  ListView _buildListView(CharacterDone state) {
    return ListView.builder(
      itemCount: state.characters?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: ListCharacterItem(
            character: state.characters![index],
            onTap: () {
              _characterInfoNavigate(context, state.characters![index]);
            },
          ),
        );
      },
    );
  }

  GridView _buildGridView(CharacterDone state) {
    return GridView.builder(
      itemCount: state.characters?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => GridCharacterItem(
        character: state.characters![index],
        onTap: () {
          _characterInfoNavigate(context, state.characters![index]);
        },
      ),
    );
  }

  void _characterInfoNavigate(context, CharacterEntity character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterInfo(
          character: character,
        ), //Filters(),
      ),
    );
  }

  void _onIconTap() {
    setState(() {
      _isGridView = !_isGridView;
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
