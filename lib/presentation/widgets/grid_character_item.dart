import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/enums.dart';

class GridCharacterItem extends StatelessWidget {
  const GridCharacterItem({
    super.key,
    required this.character,
    required this.onTap,
  });

  final CharacterEntity character;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              width: 120,
              height: 120,
              image: NetworkImage(character.image ?? ''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              character.status?.toUpperCase() ?? 'Unknown Status',
              style: AppStyles.statusAlive.copyWith(
                color: statusColor(
                  statusString(
                    character.status,
                  ),
                ),
              ),
            ),
          ),
          Text(
            character.name ?? '',
            style: AppStyles.nameStyle,
          ),
          Text(
            '${character.species}, ${character.gender}',
            style: AppStyles.raceStyle,
          ),
        ],
      ),
    );
  }
}
