import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/enums.dart';

class ListCharacterItem extends StatelessWidget {
  const ListCharacterItem({
    Key? key,
    required this.character,
    required this.onTap,
  }) : super(key: key);

  final CharacterEntity character;
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
              image: NetworkImage(character.image ?? ''),
            ),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.status?.toUpperCase() ?? 'Unknown Status',
                style: AppStyles.statusAlive.copyWith(
                  color: statusColor(
                    statusString(
                      character.status,
                    ),
                  ),
                ),
              ),
              Text(
                character.name ?? 'Unknown Name',
                style: AppStyles.nameStyle,
              ),
              Text(
                '${character.species ?? 'Unknown Species'}, ${character.gender ?? 'Unknown Gender'}',
                style: AppStyles.raceStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
