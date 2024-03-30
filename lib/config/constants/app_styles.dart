import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';

class Styles {
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

  static TextStyle nameStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle raceStyle = TextStyle(
    fontSize: 12,
    color: AppColors.race,
    letterSpacing: 0.5,
  );

  static TextStyle searchBar = TextStyle(
    fontSize: 16,
    color: AppColors.appTextColor,
    letterSpacing: 0.44,
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

  static TextStyle centerText = TextStyle(
    fontSize: 16,
    color: AppColors.appTextColor,
    letterSpacing: 0.15,
  );

  static TextStyle filterText = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.15,
  );

  static TextStyle alphabetText = const TextStyle(
    fontSize: 16,
    color: Colors.white,
    letterSpacing: 0.15,
  );
}
