import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/models/character.dart';

class ListCharacterItem extends StatelessWidget {
  const ListCharacterItem({
    super.key,
    required this.character,
    required this.onTap,
  });

  final Character character;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              width: 74,
              height: 74,
              image: NetworkImage(character.image),
            ),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.status.toUpperCase(),
                style: AppStyles.statusAlive,
              ),
              Text(
                character.name,
                style: AppStyles.nameStyle,
              ),
              Text(
                '${character.species}, ${character.gender}',
                style: AppStyles.raceStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
