import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character.dart';

class ColumnStyle extends StatelessWidget {
  const ColumnStyle({
    super.key,
    required this.character,
    required this.text,
    required this.value,
  });

  final CharacterEntity character;
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyles.raceStyle.copyWith(
            color: AppColors.appTextColor,
          ),
        ),
        Text(
          value,
          style: AppStyles.s14,
        ),
      ],
    );
  }
}
