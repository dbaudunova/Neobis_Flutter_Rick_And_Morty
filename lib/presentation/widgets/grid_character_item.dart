import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/models/character.dart';

class GridCharacterItem extends StatelessWidget {
  const GridCharacterItem({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: const Image(
            image: AssetImage('assets/png/avatar.png'),
          ),
        ),
        Text(
          character.status.toUpperCase(),
          style: Styles.statusAlive,
        ),
        Text(
          character.name,
          style: Styles.nameStyle,
        ),
        Text(
          '${character.species}, ${character.gender}',
          style: Styles.raceStyle,
        ),
      ],
    );
  }
}
