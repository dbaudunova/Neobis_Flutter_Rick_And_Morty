import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/models/episode.dart';

class EpisodeItem extends StatelessWidget {
  const EpisodeItem({
    super.key, required this.episode,
  });

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            episode.episode.toUpperCase(),
            style: AppStyles.episodeStyle,
          ),
          Text(
            episode.name,
            style: AppStyles.nameStyle,
          ),
          Text(
            episode.airDate,
            style: AppStyles.s14
                .copyWith(color: AppColors.appTextColor),
          ),
        ],
      ),
    );
  }
}
