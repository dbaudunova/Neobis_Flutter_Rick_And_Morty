import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';

class AppStyles {
  static TextStyle statusAlive = TextStyle(
    fontSize: 10,
    color: AppColors.statusAlive,
    letterSpacing: 1.5,
  );

  static TextStyle statusDead = TextStyle(
    fontSize: 10,
    color: AppColors.statusDead,
    letterSpacing: 1.5,
  );

  static TextStyle s14 = const TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  static TextStyle nameStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle raceStyle = TextStyle(
    fontSize: 12,
    color: AppColors.race,
  );

  static TextStyle searchBar = TextStyle(
    fontSize: 16,
    color: AppColors.appTextColor,
  );

  static TextStyle countAndResult = TextStyle(
    fontSize: 10,
    color: AppColors.appTextColor,
    letterSpacing: 1.5,
    fontWeight: FontWeight.bold,
  );

  static TextStyle episodeStyle = TextStyle(
    fontSize: 10,
    color: AppColors.episode,
    letterSpacing: 1.5,
  );

  static TextStyle filterText = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
