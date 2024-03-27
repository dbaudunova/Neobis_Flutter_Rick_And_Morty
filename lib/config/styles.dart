import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/app_colors.dart';

class Styles {
  static TextStyle statusAlive = TextStyle(
    fontSize: 10,
    fontFamily: 'Roboto',
    color: AppColors.statusAlive,
    letterSpacing: 1.5,
  );

  static TextStyle statusDead = TextStyle(
    fontSize: 10,
    fontFamily: 'Roboto',
    color: AppColors.statusDead,
    letterSpacing: 1.5,
  );

  static TextStyle nameStyle = const TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle raceStyle = TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto',
    color: AppColors.race,
    letterSpacing: 0.5,
  );

  static TextStyle searchBar = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    color: AppColors.appTextColor,
    letterSpacing: 0.44,
  );

  static TextStyle countAndResult = TextStyle(
    fontSize: 10,
    fontFamily: 'Roboto',
    color: AppColors.appTextColor,
    letterSpacing: 1.5,
    fontWeight: FontWeight.bold,
  );

  static TextStyle episodeStyle = TextStyle(
    fontSize: 10,
    fontFamily: 'Roboto',
    color: AppColors.episode,
    letterSpacing: 1.5,
  );

  static TextStyle centerText = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    color: AppColors.appTextColor,
    letterSpacing: 0.15,
  );
}
